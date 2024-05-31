import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { guideId: Number }
  static targets = ["subscription"]


  connect() {
    this.subscription = createConsumer().subscriptions.create(
      { channel: "SubscriberChannel", id: this.guideIdValue },
      { received: data => this.subscriptionTarget.insertAdjacentHTML("beforeend", data) }
    )
    console.log(`Subscribed to the guide with the id ${this.guideIdValue}.`)
  }
}
