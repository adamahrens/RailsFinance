import consumer from "./consumer"

consumer.subscriptions.create("StockChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Connected')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('Disconnected')
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('Got data')
    console.log(data)
    var tbody = document.querySelector("#user-stocks").querySelector("tbody")
    var row = tbody.insertRow(0)
    var c1 = row.insertCell(0)
    c1.innerHTML = data.stock.id

    var c2 = row.insertCell(1)
    c2.innerHTML = data.stock.ticker

    var c3 = row.insertCell(2)
    c3.innerHTML = data.stock.price

    var c4 = row.insertCell(3)
    c4.innerHTML = data.stock.company

    var c5 = row.insertCell(4)
    c5.innerHTML = data.stock.date
  }
});
