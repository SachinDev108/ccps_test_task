class CreateCustomerServices < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_services do |t|
      t.integer :customer_number, index: true
      t.text :comment
      t.timestamps
    end
  end
end
