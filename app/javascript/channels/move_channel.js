import consumer from "./consumer"

consumer.subscriptions.create("MoveChannel", {
  connected() {
   console.log("connected to moves channel")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data)
  }
});
