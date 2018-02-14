class Customer < ApplicationRecord
  has_many :sales, dependent: :destroy, 
    foreign_key: 'customer_number',
    primary_key: 'customer_number'
  has_many :customer_services, dependent: :destroy,
    foreign_key: 'customer_number',
    primary_key: 'customer_number'

  validates :name, :customer_number, presence: true
  validates :customer_number, uniqueness: true
  
  before_create :generate_customer_number

  
  def create_sale (sale)
    begin
      if new_record?
        customer_new_number = generate_customer_number
        transaction do
          customer = Customer.create!(sale[:customer]
            .merge(customer_number: customer_new_number))
          customer.sales.create!(sale[:sale].merge(customer_number: customer_new_number))
        end
      else
        sales.create!(sale[:sale].merge(customer_number: customer_number))
      end
    rescue ActiveRecord::RecordInvalid => exception
      self || customer
    end 
  end

  protected

  def generate_customer_number
    loop do
      uniq_number = SecureRandom.hex(10)
      break uniq_number unless Customer.where(customer_number: uniq_number).exists?
    end
  end
end
