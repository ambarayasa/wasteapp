class CreateWastes < ActiveRecord::Migration[7.0]
  def change
    create_table :wastes do |t|
      t.string :name
      t.text :descriptions
      t.float :price
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
