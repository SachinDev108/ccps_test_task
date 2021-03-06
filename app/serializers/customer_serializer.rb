# frozen_string_literal: true

class CustomerSerializer < ActiveModel::Serializer # :nodoc:
  attributes :id, :name, :surname, :customer_number

  has_many :sales
end
