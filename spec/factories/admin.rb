FactoryBot.define do
  factory :admin do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { 'password' }
    
  end
end