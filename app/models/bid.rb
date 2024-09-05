class Bid < ApplicationRecord
  belongs_to :auction

  validates :amount, numericality: { greater_than: :current_price }
end
