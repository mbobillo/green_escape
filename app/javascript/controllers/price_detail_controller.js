import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-detail"
export default class extends Controller {
  static targets = ["startDate", "endDate", "priceNightWrapper", "priceActivityWrapper", "total", "numberOfNights","activityWrap", "numberOfGuests", "activityPrice", "totalActivity"]
  static values = { price: Number, capacity: Number, activityPrice: Number }

  toggle() {
    const numberOfNights = this.#computeNumberOfNights()
    const totalPrice = this.#computeTotalPrice(numberOfNights, this.priceValue)

    this.totalTarget.innerText = `${totalPrice}€`
    this.numberOfNightsTarget.innerText = numberOfNights
    this.priceNightWrapperTarget.classList.toggle("d-none");
  }

  toggleActivity(e) {
    this.activityWrapTarget.classList.toggle("d-none");
    this.priceActivityWrapperTarget.classList.toggle("d-none");
    this.totalActivityTarget.innerText = `${this.#computeTotalActivity()}€`
    window.scrollTo(0, 0);
  }

  #computeNumberOfNights() {
    let dateDiffInMilliseconds = new Date(this.endDateTarget.value) - new Date(this.startDateTarget.value);
    return dateDiffInMilliseconds / 86400000;
  }

  #computeTotalPrice(numberOfNights, flatPricePerNight) {
    debugger

    return numberOfNights * flatPricePerNight
  }

  #computeTotalActivity() {
    return this.capacityValue * this.activityPriceValue
  }
}
