import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log(this.element)
  }

  enlarge(event) {
    event.currentTarget.classList.add("card-pic-enlarged")
  }
}
