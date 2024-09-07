import { Controller } from "@hotwired/stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static targets = ["bids"];

  connect() {
    const auctionId = this.element.getAttribute("data-auction-id"); 
    
    if (auctionId) {
      this.channel = consumer.subscriptions.create(
        { channel: "AuctionChannel", id: auctionId },
        {
          received: (data) => {
            console.log(this);
            this.bidsTarget.insertAdjacentHTML("beforeend", data.bid);
          },
        }
      );
    }
  }

  disconnect() {
    this.channel.unsubscribe();
  }
}
