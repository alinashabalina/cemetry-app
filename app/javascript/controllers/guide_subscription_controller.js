import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["subscription", "button"]
  static values = {id: { type: String, default: window.location.pathname.split('/')[2] }}
  id = window.location.pathname.split('/');

  connect() {
    this.subscription = createConsumer().subscriptions.create(
      { channel: "SubscriptionsChannel", guide_id: this.idValue, message: 0 },
      { received: data => this.subscriptionTarget.insertAdjacentHTML("beforeend", data) }
    )
  }

  subscribe(event) {
    event.preventDefault()
    const response = fetch(`/guides/${this.idValue}/subscriptions`, {
      method: "POST"
    },
    )
  }}
