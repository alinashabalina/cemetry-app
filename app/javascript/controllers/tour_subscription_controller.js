import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["tour", "button"]
  static values = {id: { type: String, default: window.location.pathname.split('/')[2] }}

  connect() {
      this.subscription = createConsumer().subscriptions.create(
        { channel: "ToursChannel", id: this.idValue },
        { received: data => this.tourTarget.textContent = data }
      )

    }

    disconnect() {
      console.log("Unsubscribed from the chatroom")
      this.subscription.unsubscribe()
    }

  }
