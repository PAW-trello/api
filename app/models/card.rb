class Card < ApplicationRecord
  belongs_to :list
  has_many :comments
  validates_presence_of :title
end
