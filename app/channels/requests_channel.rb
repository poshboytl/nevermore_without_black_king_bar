# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RequestsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "requests_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def request(data)
    Rails.logger.info "==============#{data}"
  end
end
