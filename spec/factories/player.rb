FactoryBot.define do
  factory :player do
    association :team
    name { Faker::Name.unique.name }
    birth_date { Faker::Date.birthday(min_age: 15, max_age: 95) }
    nationality {Faker::Name.unique.name }
    position { Faker::String.random(length: 1) }
    sequence(:number) { |n| n }
  end
end