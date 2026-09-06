import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropdown"]

  toggle() {
    if (this.dropdownTarget.style.display === "none") {
      this.dropdownTarget.style.display = "block"
    } else {
      this.dropdownTarget.style.display = "none"
    }
  }
}
