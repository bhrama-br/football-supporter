FactoryBot.define do
  factory :team do
    name { Faker::Name.unique.name }
    acronym { Faker::String.random(length: 2) }

    trait :with_players do
      players { build_list(:player, 4) }
    end
  end
end