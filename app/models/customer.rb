# frozen_string_literal: true

class Customer < ApplicationRecord # :nodoc:
  has_many :sales, dependent: :destroy, foreign_key: 'customer_number',
                   primary_key: 'customer_number'
  has_many :customer_services, dependent: :destroy,
                               foreign_key: 'customer_number',
                               primary_key: 'customer_number'

  validates :name, :customer_number, presence: true
  validates :customer_number, uniqueness: true

  def create_customer(params)
    self.name = params[:name]
    self.surname = params[:surname]
    save
    self
  end

  def self.generate_customer_number
    loop do
      uniq_id = SecureRandom.hex(10)
      break uniq_id unless Customer.where(customer_number: uniq_id).exists?
    end
  end
end
