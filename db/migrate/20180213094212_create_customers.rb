class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :surname
      t.integer :customer_number, index: true, unique: true
      t.timestamps
    end
  end
end
