import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["button"]
  static values = {
    id: String,
    default: "1"
  }

  connect() {}

  book(event) {
    event.preventDefault()
    const response = fetch(`/book/1`, {
      method: "POST"
    })
    .then(response => response.json())
    .then(data => {if (data.status == 201) {alert(`Your booking with ${data.message.info} is successful`)} else {alert (data.message.info)}})

  }

    disconnect() {
      this.subscription.unsubscribe()
    }

  }
