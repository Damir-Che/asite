class Post < ApplicationRecord

  validates :title, :body, presence: true #проверка на не пустое значение
  acts_as_taggable_on :tags # тэги
  mount_uploader :image, ImageUploader #доб картинок
  enum kind: [:regular, :history] #enum
  enum status: [:onModeretion, :published, :hidden] #enum

  belongs_to :user
  has_many :comments
  has_many :likes
end
