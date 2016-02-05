App.requests = App.cable.subscriptions.create "RequestsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if currentUser == data.provider
      for index, ele of credit_records
        if ele.commit == data.commit
          toastr.info('You received a request')
          setTimeout ( ->
            response_data = localStorage.getItem ele.commit
            App.responses.response(response_data, currentUser, data.buyer) if response_data
          ), 5000
    if currentUser == data.buyer
      for index, ele of credit_records
        if ele.commit == data.commit
          ele.orderstate = 1
      toastr.info('Request send successfully')



  request: (list, currentUser)->
    @perform 'request', list: list, current_user: currentUser
