class RemoveFeedbackForSellerFromPurchases < ActiveRecord::Migration[5.2]
  def change
    remove_column :purchases, :feedback_for_seller, :integer
  end
end
