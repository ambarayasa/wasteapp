class CreateTransactionDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_details do |t|
      t.integer :quantity
      t.float :subtotal
      t.references :transaction, null: false, foreign_key: true
      t.references :waste, null: false, foreign_key: true
      t.timestamps
    end
  end
end
