# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class ResponsesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "responses_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def response(data)
    response = data['response']
    provider = data['provider']
    buyer = data['buyer']
    ActionCable.server.broadcast 'responses_channel', data: response, provider: provider, buyer: buyer
  end
end
