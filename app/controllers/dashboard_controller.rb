class DashboardController < ApplicationController
  def index
    session # trigger rails create session
    @current_user = session.id
    @credit_books = CreditBook.all
  end
end
