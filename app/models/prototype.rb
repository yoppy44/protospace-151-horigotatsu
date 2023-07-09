class Prototype < ApplicationRecord

  validates :title, :catchcopy, :oncept, presence, image: true
  belongs_to :user
  has_one_attached :image
end
