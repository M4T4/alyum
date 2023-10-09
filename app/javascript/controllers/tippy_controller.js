import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="slim-select"
export default class extends Controller {
  connect() {
    tippy('#tippy', {
      content: 'My tooltip!',
    });
  }
}