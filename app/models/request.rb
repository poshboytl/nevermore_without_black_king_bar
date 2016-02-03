class Request < ApplicationRecord
  enum state: { unpurchase: 0, purchased: 1, accepted: 2}

  belongs_to :credit_book
end
