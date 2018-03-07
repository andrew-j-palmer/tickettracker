class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :body, length: {minimum: 8}
  CURRENTSTATUS = %w(Unverified Verified Development Q.A. Resolved)
end
