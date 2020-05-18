class Purchase < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  enum btc_sent: { not_sent: 0, sent: 1 }
  enum feedback_for_seller: { negative: 0, positive: 1 }
  scope :filter_by_btc_sent, -> (btc_sent) { where btc_sent: btc_sent }
  scope :filter_by_feedback_for_seller, -> (feedback_for_seller) { where feedback_for_seller: feedback_for_seller }
end
