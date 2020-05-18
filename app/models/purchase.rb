class Purchase < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  enum btc_sent: { not_sent: 0, sent: 1 }
  enum feedback_for_seller: { negative: 0, positive: 1 }
end
