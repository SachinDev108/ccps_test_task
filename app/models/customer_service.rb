class CustomerService < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_number', primary_key: 'customer_number'
end
