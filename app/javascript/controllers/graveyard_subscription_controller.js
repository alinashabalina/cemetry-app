import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["info"]
  static values = {id: { type: String, default: window.location.pathname.split('/')[4]}}

  connect() {
      this.subscription = createConsumer().subscriptions.create(
        { channel: "GraveyardsChannel", id: this.idValue},
        { received: data => {data.forEach((el) => this.infoTarget.textContent = el.title);}})}

    disconnect() {
      this.subscription.unsubscribe()
    }

  }
