import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["subscription", "button"]
  static values = {id: { type: String, default: window.location.pathname.split('/')[2] }}

  connect() {
      this.subscription = createConsumer().subscriptions.create(
        { channel: "SubscriptionsChannel", id: this.idValue },
        { received: data => this.subscriptionTarget.textContent = data }
      )

    }

  subscribe(event) {
    event.preventDefault()
    const a = parseInt(this.idValue, 10)
    const response = fetch(`/guides/${a}/subscriptions`, {
      method: "POST"
    })
    .then(response => {if (response.status == 200) {this.buttonTarget.textContent = "Subscribed"; this.buttonTarget.disabled = true;} else {alert("Log in to subscribe")}})



  }

    disconnect() {
      console.log("Unsubscribed from the chatroom")
      this.subscription.unsubscribe()
    }

  }
