class Ticket < ApplicationRecord
  has_attached_file :screenshot, 
    styles: { full: "640x480>", thumb: "160x120>" },
    storage: :cloudinary,
    path: ':id/:style/:filename',
    cloudinary_resource_type: :image  
  has_many :comments, dependent: :destroy
  validates :title, length: { minimum: 8 }
  validates :description, length: { minimum: 32 }
  validates :status, presence: true
  validates_attachment :screenshot,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  STATUS = %w(Unverified Verified Development Q.A. Resolved)


  def active
    status !=  "Resolved"
  end
end
