class CreditBook < ApplicationRecord
  enum category: { credit: 0, secured: 1, collateral: 2 }
  enum state: { applying: 0, in_progress: 1, done: 2 }

  before_create :generate_commit, :set_unixtime

  private

  def generate_commit
    self.commit = "0x#{SecureRandom.hex(32)}"
  end

  def set_unixtime
    self.unixtime = self.created_at.to_i
  end
end
