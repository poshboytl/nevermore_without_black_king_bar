App.credit_books = App.cable.subscriptions.create "CreditBooksChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    book = data.credit_book
    if book.provider == currentUser
      book.owner = true
    else
      book.owner = false
    book.orderstate = 0
    window.credit_records.push book
    # Called when there's incoming data on the websocket for this channel

  create: (credit_book)->
    @perform 'create', credit_book: credit_book
