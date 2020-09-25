class Post < ApplicationRecord

  acts_as_taggable_on :tags # тэги

  mount_uploader :image, ImageUploader #доб картинок

  enum kind: [:regular, :history] #enum

  belongs_to :user
  has_many :comments
  has_many :likes
end
