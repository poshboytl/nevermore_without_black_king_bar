App.requests = App.cable.subscriptions.create "RequestsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if currentUser == data.provider
      for index, ele of credit_records
        if ele.commit == data.commit
          ele.orderstate = 1
          toastr.info('You received a request')
    if currentUser == data.buyer
      toastr.info('Request send successfully')



  request: (list, currentUser)->
    @perform 'request', list: list, current_user: currentUser
