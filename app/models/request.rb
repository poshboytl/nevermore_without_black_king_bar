class Request < ApplicationRecord
  enum state: { unpurchase: 0, purchased: 1, accepted: 2}

  validates :sender, uniqueness: { scope: :credit_book_id }
  belongs_to :credit_book
end
