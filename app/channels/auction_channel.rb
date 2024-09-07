class AuctionChannel < ApplicationCable::Channel
  def subscribed
   stream_from "auction_#{params[:id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
