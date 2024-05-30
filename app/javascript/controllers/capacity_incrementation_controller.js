import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["capacity"]

  increment() {
    this.capacityTarget.value = parseFloat(this.capacityTarget.value) + 1
  }

  decrement() {
    if (parseFloat(this.capacityTarget.value) > 0 )
    this.capacityTarget.value = parseFloat(this.capacityTarget.value) - 1

  }
}
