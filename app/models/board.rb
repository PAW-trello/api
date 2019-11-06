# frozen_string_literal: true

class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  validates_presence_of :name, :user_id
end
