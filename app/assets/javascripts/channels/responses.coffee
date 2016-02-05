App.responses = App.cable.subscriptions.create "ResponsesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if currentUser == data.buyer
      response = JSON.parse data.data
      localStorage.setItem(response.commit, data.data)
      for index, ele of credit_records
        if ele.commit == response.commit
          ele.orderstate = 2
          toastr.info('You request receive a response.')
    if currentUser == data.provider
      toastr.info('You just reponse the request automatically.')

    # Called when there's incoming data on the websocket for this channel

  response: (response, provider, buyer) ->
    @perform 'response', response: response, provider: provider, buyer: buyer
