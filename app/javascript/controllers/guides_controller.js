import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bio"]
  connect() {
  }

  show(event) {
    event.preventDefault();
    const id = event.currentTarget.id
    const response = fetch(`/info-g/${id}`, {
      method: "GET"
    })
    .then(response=>response.json())
    .then(data=>{
      this.bioTarget.textContent = data.message.bio})
  }
}
