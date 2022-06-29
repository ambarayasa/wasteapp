class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.string :email
      t.string :name
      t.string :address
      t.string :gender
      t.float :balance
      t.references :role, null: false, foreign_key: true
      t.timestamps
    end
  end
end
