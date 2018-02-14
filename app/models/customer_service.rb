# frozen_string_literal: true

class CustomerService < ApplicationRecord # :nodoc:
  belongs_to :customer, foreign_key: 'customer_number',
                        primary_key: 'customer_number'
end
