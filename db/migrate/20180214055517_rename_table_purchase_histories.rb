class RenameTablePurchaseHistories < ActiveRecord::Migration[5.1]
  def change
    rename_table :purchase_histories, :sales
  end
end
