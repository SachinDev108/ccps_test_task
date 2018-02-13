class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :customer_number
end
