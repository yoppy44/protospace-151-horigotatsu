class Prototype < ApplicationRecord

  validates :title, :catchcopy, :oncept, presence: true
  belongs_to :user
end
