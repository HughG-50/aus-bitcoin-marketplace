class AddStatusToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :status, :integer
  end
end
