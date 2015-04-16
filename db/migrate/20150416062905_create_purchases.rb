class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :product, index: true
      t.string :name
      t.string :email
      t.text :address
      t.string :telephone
      t.string :card_token

      t.timestamps null: false
    end
    add_foreign_key :purchases, :products
  end
end
