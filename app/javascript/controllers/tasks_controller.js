import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      animation: 300,
      ghostClass: "drag-placeholder",
      chosenClass: "chosen-task",
      dragClass: "dragging-task",
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
