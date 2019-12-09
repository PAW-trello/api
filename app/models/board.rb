# frozen_string_literal: true

class Board < ApplicationRecord
  has_many :lists, ->{order 'lists.display_order'} , dependent: :destroy
  validates_presence_of :name, :user_id
end
