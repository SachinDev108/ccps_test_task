class PurchaseHistorySerializer < ActiveModel::Serializer
  attributes :id, :item, :date_of_transaction, :source

  belongs_to :customer
end
