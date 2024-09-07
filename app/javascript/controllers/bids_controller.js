import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"]

  connect() {
  }

  handleSubmit(event) {
    const formElement = document.querySelector('[data-controller="bids"]');
  
    if (formElement) {
      formElement.reset(); // Clear the form inputs after bid placed
    } else {
      console.error('Form target not found');
    }
  }
}
