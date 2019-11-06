# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  it { should belong_to(:board) }
  it { should validate_presence_of(:title) }
end