# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :board
  has_many :cards
  validates_presence_of :title

  after_create :set_default_display_order

  private

  def set_default_display_order
    self.update_attributes!(display_order:(( self.board.lists.maximum("display_order") or 0) + 1))
  end 
end
