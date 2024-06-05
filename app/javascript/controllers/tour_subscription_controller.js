import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["container"]
  static values = {id: { type: String, default: window.location.pathname.split('/')[2] }}

  connect() {
    console.log("connected")
      this.subscription = createConsumer().subscriptions.create(
        { channel: "ToursChannel", id: this.idValue },
        { received: data => {if (data.length === 0) {this.containerTarget.textContent = "No tours found"} else {this.containerTarget.textContent = "new tours found"}}})}

    show(event) {
      event.preventDefault()
      const response = fetch("/subscriptions")
      .then(response => {if (response.status !== 200) {alert("not op")}})

    }

    disconnect() {
      console.log("Unsubscribed from the chatroom")
      this.subscription.unsubscribe()
    }

  }
