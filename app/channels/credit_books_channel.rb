# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class CreditBooksChannel < ApplicationCable::Channel
  def subscribed
    stream_from "credit_books_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(data)
    credit_book = CreditBook.create(data['credit_book'])
    ActionCable.server.broadcast "credit_books_channel", credit_book: credit_book
  end
end
