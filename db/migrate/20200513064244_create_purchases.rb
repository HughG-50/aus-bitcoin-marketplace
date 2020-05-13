class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :listing, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :feedback_for_seller
      t.boolean :btc_sent

      t.timestamps
    end
  end
end
