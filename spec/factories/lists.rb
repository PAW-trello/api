# frozen_string_literal: true

# spec/factories/lists.rb
FactoryBot.define do
  factory :list do
    title { Faker::Lorem.word }
    board_id nil
  end
end
