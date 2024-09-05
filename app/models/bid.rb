class Bid < ApplicationRecord
  belongs_to :auction

  validates :amount, numericality: { greater_than: ->(bid) { bid.auction.current_price } }

  after_create_commit do
    auction.update!(current_price: amount)
  end
end
