class Listing < ApplicationRecord
  belongs_to :user
  has_one :purchase, dependent: :destroy
  enum status: { available_listing: 0, pending_completion: 1, completed_listing: 2 }
  enum feedback_for_seller: { negative: 0, positive: 1 }
  # Filtering to be used to create desired dashboards views
  scope :filter_by_status, -> (status) { where status: status }
  scope :filter_by_feedback_for_seller, -> (feedback_for_seller) { where feedback_for_seller: feedback_for_seller }
end
