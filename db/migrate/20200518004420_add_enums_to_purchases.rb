class AddEnumsToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :btc_sent, :integer
    add_column :purchases, :feedback_for_seller, :integer
  end
end
