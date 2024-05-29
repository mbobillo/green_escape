import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-detail"
export default class extends Controller {
  static targets = ["startDate", "endDate", "priceWrapper", "total", "numberOfNights"]
  static values = { price: Number }

  toggle() {
    const numberOfNights = this.#computeNumberOfNights()
    const totalPrice = this.#computeTotalPrice(numberOfNights, this.priceValue)

    this.totalTarget.innerText = `${totalPrice}€`
    this.numberOfNightsTarget.innerText = numberOfNights
    this.priceWrapperTarget.classList.toggle("d-none");
  }

  #computeNumberOfNights() {
    let dateDiffInMilliseconds = new Date(this.endDateTarget.value) - new Date(this.startDateTarget.value);
    return dateDiffInMilliseconds / 86400000;
  }

  #computeTotalPrice(numberOfNights, flatPricePerNight) {
    debugger

    return numberOfNights * flatPricePerNight
  }
}
