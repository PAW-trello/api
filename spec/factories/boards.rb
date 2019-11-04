
# spec/factories/boards.rb
FactoryBot.define do
  factory :board do
    name { Faker::Lorem.word }
    user_id { Faker::Number.number(10) }
  end
end