class AddItemsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :btc_address, :string
    add_column :users, :feedback_score, :integer
    add_column :users, :num_btc_purchases, :integer
    add_column :users, :num_completed_listings, :integer
    add_column :users, :country, :string
    add_column :users, :city, :string
  end
end
