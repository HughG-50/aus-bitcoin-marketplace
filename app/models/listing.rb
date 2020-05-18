class Listing < ApplicationRecord
  belongs_to :user
  has_one :purchase, dependent: :destroy
  enum status: { available_listing: 0, pending_completion: 1, completed_listing: 2 }
  scope :filter_by_status, -> (status) { where status: status }

  # Added to allow Form in dashboard/pending_listings to accept multiple attributes/update both listing and purchase at same time
  accepts_nested_attributes_for :purchase, update_only: true
end
