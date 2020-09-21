class Post < ApplicationRecord

  mount_uploader :image, ImageUploader

  enum status: [:regular, :history]

  belongs_to :user
  has_many :comments
  has_many :likes
end
