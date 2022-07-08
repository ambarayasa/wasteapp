class AddUnitpriceToTransactionDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :transaction_details, :unit_price, :float
  end
end
