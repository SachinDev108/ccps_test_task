class Customer < ApplicationRecord
  has_many :purchase_histories, dependent: :destroy, foreign_key: 'customer_number'
  has_many :customer_services, dependent: :destroy, foreign_key: 'customer_number'

  validates :name, :customer_number, presence: true
  validates :customer_number, uniqueness: true
  
end
