class CreditBook < ApplicationRecord
  enum category: { credit: 0, secured: 1, collateral: 2 }
  enum state: { applying: 0, in_progress: 1, done: 2 }
  has_many :requests

  validates :commit, uniqueness: { scope: :fee}


  before_create :generate_commit, :set_unixtime

  def as_json(options = {})
    current_user = options[:current_user]
    credit_book = {
      provider: self.provider,
      identity: self.identity,
      category: CreditBook.categories[self.category],
      state: CreditBook.states[self.state],
      fee: self.fee,
      timestamp: self.unixtime,
      commit: self.commit,
    }

    if current_user
      credit_book.merge!({
        orderstate: order_sate(current_user),
        owner: provider == current_user
      })
    end

    credit_book
  end


  private

  def generate_commit
    self.commit = "0x#{SecureRandom.hex(32)}" unless self.commit
  end

  def set_unixtime
    self.unixtime = self.created_at.to_i
  end

  def order_sate(user)
    st = requests.where(sender: user).first.try(:state)
    if st
      Request.states[st]
    else
      0
    end
  end

end
