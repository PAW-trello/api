# spec/factories/tasks.rb
FactoryBot.define do
  factory :task do
    title { Faker::Lorem.word }
    description { Faker::Lorem.word }
  end
end