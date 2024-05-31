import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bio"]
  connect() {
    console.log(this.element)
  }

  show(event) {
    event.preventDefault();
    const id = event.currentTarget.id
    const response = fetch(`/guides/${id}`, {
      method: "GET"
    })
    .then(response=>response.json())
    .then(data=>{this.bioTarget.classList.remove("bio-none");
      this.bioTarget.textContent = data.message.bio})
  }

  close(event) {
    event.preventDefault();
    this.bioTarget.textContent = ""
    this.bioTarget.classList.remove("bio")
  }
}
