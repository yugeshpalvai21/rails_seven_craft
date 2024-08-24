import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      animation: 300, // Increased animation time for smoother transitions
      ghostClass: "drag-placeholder", // Placeholder class
      chosenClass: "chosen-task", // Class for the item being dragged
      dragClass: "dragging-task", // Class for smooth dragging
      easing: "cubic-bezier(0.25, 1, 0.5, 1)", // Smooth easing for transitions
      onEnd: this.end.bind(this),
    });
  }

  end(event) {
    let ids = this.sortable.toArray();

    fetch(this.element.dataset.tasksSortUrl, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name=csrf-token]").content,
      },
      body: JSON.stringify({ task: ids }),
    });
  }
}
