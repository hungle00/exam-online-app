import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("hello")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(`New notification! Now you have ${data.message} unread notifications`)
    let unread = `<span class="p-1 border border-0 rounded-circle bg-danger text-white">${data.message}</span>`
    $(".notifications").html(unread)
  }
});
