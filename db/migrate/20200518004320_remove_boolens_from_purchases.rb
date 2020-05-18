class RemoveBoolensFromPurchases < ActiveRecord::Migration[5.2]
  def change
    remove_column :purchases, :btc_sent, :boolean
    remove_column :purchases, :feedback_for_seller, :boolean
  end
end
