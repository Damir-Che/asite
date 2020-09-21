class Post < ApplicationRecord

  mount_uploader :image, ImageUploader

  enum kind: [:regular, :history]

  belongs_to :user
  has_many :comments
  has_many :likes
end
