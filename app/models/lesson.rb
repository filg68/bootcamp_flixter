class Lesson < ApplicationRecord
  belongs_to :section

  validates :title, presence: true
  validates :subtitle, presence: true
end
