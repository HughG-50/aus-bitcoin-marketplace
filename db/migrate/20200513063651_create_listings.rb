class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.string :payment_method
      t.integer :price_BTC_AUD
      t.integer :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
