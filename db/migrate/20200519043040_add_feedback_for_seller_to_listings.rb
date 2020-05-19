class AddFeedbackForSellerToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :feedback_for_seller, :integer
  end
end
