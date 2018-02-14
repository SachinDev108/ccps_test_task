# frozen_string_literal: true

class SaleSerializer < ActiveModel::Serializer # :nodoc:
  attributes :id, :item, :date_of_transaction, :source

  belongs_to :customer
end
