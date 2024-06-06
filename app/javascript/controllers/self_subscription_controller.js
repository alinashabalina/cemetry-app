import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["container"]
  static values = {id: { type: String, default: window.location.pathname.split('/')[2] }}

  connect() {
      this.subscription = createConsumer().subscriptions.create(
        { channel: "SelfChannel", id: this.idValue },
        { received: data => {console.log(data); this.containerTarget.textContent = data.title} })}


        disconnect() {
      this.subscription.unsubscribe()
    }

  }
