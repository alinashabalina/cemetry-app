import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["container"]
  static values = {id: { type: String, default: window.location.pathname.split('/')[2] }}

  connect() {
      this.subscription = createConsumer().subscriptions.create(
        { channel: "ToursChannel", id: this.idValue },
        { received: data => {if (data.length > 0) {data.forEach((element) => {this.containerTarget.textContent = element.title});}}})}

    disconnect() {
      this.subscription.unsubscribe()
    }

  }
