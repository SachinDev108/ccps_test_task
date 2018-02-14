class Customer < ApplicationRecord
  has_many :sales, dependent: :destroy, foreign_key: 'customer_number'
  has_many :customer_services, dependent: :destroy, foreign_key: 'customer_number'

  validates :name, :customer_number, presence: true
  validates :customer_number, uniqueness: true
  
  before_create :generate_customer_number

  
  def create_sale (sale)
    begin
      if new_record?
        transaction do
          create!(attributes.merge(customer_number: generate_customer_number))
          Sale.create!(sale)
        end
      else
        Sale.create!(sale)
      end
    rescue ActiveRecord::RecordInvalid => exception
      customer
    end 
  end

  protected

  def generate_customer_number
    self.customer_number = SecureRandom.urlsafe_base64
    generate_customer_number if self.exists?(customer_number: self.customer_number)
  end
end
