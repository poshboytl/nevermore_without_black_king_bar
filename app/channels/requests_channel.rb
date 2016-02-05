# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RequestsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "requests_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def request(data)
    list = data['list']
    user = data['current_user']
    list.each do |element|
      commit = element['commit']
      cb = CreditBook.where(commit: commit).first
      if cb
        cb.requests.create(state: :purchased, sender: user, fee: element['fee'])
        ActionCable.server.broadcast "requests_channel", commit: cb.commit, provider: cb.provider, buyer: user, fee: element['fee']
      end
    end
  end
end
