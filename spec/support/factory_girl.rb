require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    name 'Farmer Jane'
    farmer false
    password 'password'
    password_confirmation 'password'
  end

end
