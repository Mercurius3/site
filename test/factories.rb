require 'faker'
Faker::Config.locale = :nl

FactoryGirl.define do
	factory :user do
		email "test@test.nl"
		first_name "John"
		last_name "Doe"
		password "xxxxxx"
		password_confirmation "xxxxxx"
		admin false
  	end

#  factory :user do
#    email { Faker::Internet.email }
#    first_name { Faker::Name.first_name }
#    last_name  { Faker::Name.last_name }
#    password "h!12345678"
#    password_confirmation "h!12345678"
#    street { Faker::Address.street_name }
#    street_number { Faker::Address.street_suffix }
#    post_code { Faker::Address.postcode }
#    city { Faker::Address.city }
#    admin false
#
#    trait :wrong_street_number do
#      street_number "111"
#    end
#
#    factory :user_without_street_number, traits: [:wrong_street_number]
#  end
end
