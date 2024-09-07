class BidsController < ApplicationController
  def create
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.new(bid_params)

    if @bid.save
      # Broadcast the new bid to all subscribers
      ActionCable.server.broadcast "auction_#{@auction.id}_channel",
                               { bid: render_to_string(partial: "bids/bid", locals: { bid: @bid }) }
      head :ok
    else
      # Handle errors, e.g., render :new or send error message
      render json: { error: @bid.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount)
  end
end
