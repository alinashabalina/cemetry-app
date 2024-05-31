import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log(this.element)
  }

  enlarge(event) {
    if (event.currentTarget.classList.contains("card-pic-enlarged"))
    {event.currentTarget.classList.remove("card-pic-enlarged")}
    else {
      event.currentTarget.classList.add("card-pic-enlarged")
    }
  }
}
