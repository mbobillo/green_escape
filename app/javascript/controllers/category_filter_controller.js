import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category-filter"
export default class extends Controller {
  static targets = ["list"]

  submit() {
    console.log("ok mb")
    const params = new URLSearchParams(new FormData(this.element)).toString()
    fetch(`/accomodations?${params}`, {
      method: 'GET',
      headers: {
        "Accept": "application/json",
      }
    })
    .then(response => response.json())
    .then(data => {
      this.listTarget.outerHTML = data.list_partial
    })
  }
}
