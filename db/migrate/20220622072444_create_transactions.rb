class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :date
      t.text :descriptions
      t.float :total
      t.references :user, null: false, foreign_key: true
      t.references :depot, null: false, foreign_key: true
      t.timestamps
    end
  end
end
