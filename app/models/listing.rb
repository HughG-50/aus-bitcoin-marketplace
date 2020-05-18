class Listing < ApplicationRecord
  belongs_to :user
  has_one :purchase 
  enum status: { available_listing: 0, pending_completion: 1, completed_listing: 2 }
  scope :filter_by_status, -> (status) { where status: status }
end
