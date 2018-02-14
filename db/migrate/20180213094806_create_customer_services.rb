# frozen_string_literal: true

class CreateCustomerServices < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_services do |t|
      t.string :customer_number, index: true
      t.text :comment
      t.timestamps
    end
  end
end
