# frozen_string_literal: true

class Sale < ApplicationRecord # :nodoc:
  belongs_to :customer, foreign_key: 'customer_number',
                        primary_key: 'customer_number'

  SOURCE_LIST = %w[instore e-commerce mobile].freeze

  validates :item, :customer_number, :price, :date_of_transaction,
            :source, presence: true

  validates :price, numericality: true
  validates :source, inclusion: { in: SOURCE_LIST,
                                  message: "%<value>s not in #{SOURCE_LIST}" }
end
