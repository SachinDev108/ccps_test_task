# frozen_string_literal: true

class Customer < ApplicationRecord # :nodoc:
  has_many :sales, dependent: :destroy, foreign_key: 'customer_number',
                   primary_key: 'customer_number'
  has_many :customer_services, dependent: :destroy,
                               foreign_key: 'customer_number',
                               primary_key: 'customer_number'

  validates :name, :customer_number, presence: true
  validates :customer_number, uniqueness: true

  before_create :generate_customer_number

  def create_sale(sale)
    if new_record?
      transaction do
        add_customer_and_sale(sale)
      end
    else
      sales.create!(sale[:sale].merge(customer_number: customer_number))
    end
  rescue ActiveRecord::RecordInvalid => exception
    exception
  end

  protected

  def add_customer_and_sale(sale)
    customer_new_number = generate_customer_number
    customer = Customer.create!(sale[:customer]
      .merge(customer_number: customer_new_number))
    customer.sales.create!(sale[:sale])
  end

  def generate_customer_number
    loop do
      uniq_id = SecureRandom.hex(10)
      break uniq_id unless Customer.where(customer_number: uniq_id).exists?
    end
  end
end
