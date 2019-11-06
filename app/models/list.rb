# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :board
  validates_presence_of :title
end
