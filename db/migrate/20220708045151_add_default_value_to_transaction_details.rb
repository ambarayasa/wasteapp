class AddDefaultValueToTransactionDetails < ActiveRecord::Migration[7.0]
  def change
    change_column :transaction_details, :subtotal, :float, :default => 0.0
  end
end
