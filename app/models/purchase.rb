class Purchase < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  enum btc_sent: { not_sent: 0, sent: 1 }
  scope :filter_by_btc_sent, -> (btc_sent) { where btc_sent: btc_sent }
end
