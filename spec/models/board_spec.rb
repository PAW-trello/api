require 'rails_helper'

# Test suite for the Board model
RSpec.describe Board, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
end