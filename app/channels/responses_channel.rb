# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class ResponsesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "responses_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def response(data)
    raw_response = data['response']
    provider = data['provider']
    buyer = data['buyer']

    response = ActiveSupport::JSON.decode raw_response
    commit = response['commit']

    cb = CreditBook.where(commit: commit).first
    if cb
      cb.requests.where(sender: buyer).first.update_attributes(state: :accepted)
    end

    ActionCable.server.broadcast 'responses_channel', data: raw_response, provider: provider, buyer: buyer
  end
end
