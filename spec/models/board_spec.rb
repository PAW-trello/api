# frozen_string_literal: true

require 'rails_helper'

# Test suite for the Board model
RSpec.describe Board, type: :model do
  # Validation tests
  it { should have_many(:lists).dependent(:destroy) }
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
end
