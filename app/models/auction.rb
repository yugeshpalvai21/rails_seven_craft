class Auction < ApplicationRecord
  validates :title, :description, :starting_price, presence: true
  validates :current_price, numericality: { greater_than_or_equal_to: :starting_price }
end
