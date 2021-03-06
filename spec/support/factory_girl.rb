require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    name 'Farmer Jane'
    farmer true
    password 'password'
    password_confirmation 'password'
  end

  factory :farm do
    sequence(:name) { |n| "Happy Valley Farm#{n}" }
    sequence(:email) {|n| "farm#{n}@example.com" }
    phone '1232343456'
    address '234 Water St.'
    city 'Harrisonburg'
    state 'VA'
    zip '22801'
    latitude '-81.34523'
    longitude '35.45364'
    user
  end

end
