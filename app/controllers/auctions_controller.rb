class AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
  end
  def show
    @auction = Auction.find(params[:id])
    @bids = @auction.bids.order(created_at: :desc)
    @bid = @auction.bids.new
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    if @auction.save
      redirect_to auction_path(@auction), notice: "Auction created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :description, :starting_price, :current_price)
  end
end
