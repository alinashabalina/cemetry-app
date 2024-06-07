import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["info"]
  static values = {id: { type: String, default: window.location.pathname.split('/')[4]}, city: { type: String, default: window.location.pathname.split('/')[2]}}

  connect() {
      this.subscription = createConsumer().subscriptions.create(
        { channel: "GraveyardsChannel", id: this.idValue},
        { received: data => { if (data) {if (data.length > 0) {data.forEach((el) => this.infoTarget.textContent = el.title);} else {this.infoTarget.textContent ="No upcoming tours"}} else {this.infoTarget.textContent ="No upcoming tours"}} })}

    refresh() {
      fetch(`/cities/${this.cityValue}/graveyards/${this.idValue}`)
    }

    disconnect() {
      this.subscription.unsubscribe()
    }

  }
