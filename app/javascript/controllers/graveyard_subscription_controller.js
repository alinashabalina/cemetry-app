import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["info"]
  static values = {id: { type: String, default: window.location.pathname.split('/')[4] }, cityId: { type: String, default: window.location.pathname.split('/')[2] }}

  connect() {
    console.log("connected")
      this.subscription = createConsumer().subscriptions.create(
        { channel: "GraveyardsChannel", id: this.idValue, city_id: this.cityIdValue },
        { received: data => {if (data) {this.infoTarget.textContent = "Tours"} else {this.infoTarget.textContent = "no tours found"}}})}

    disconnect() {
      console.log("Unsubscribed from the chatroom")
      this.subscription.unsubscribe()
    }

  }
