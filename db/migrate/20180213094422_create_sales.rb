# frozen_string_literal: true

class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.string :customer_number, index: true
      t.string :item
      t.string :price
      t.datetime :date_of_transaction
      t.string :source
      t.timestamps
    end
  end
end
