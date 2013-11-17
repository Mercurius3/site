FactoryGirl.define do
  factory :user do
    email "johndoe@example.com"
    first_name "John"
    last_name  "Doe"
    password "12345678"
    password_confirmation "12345678"
    street "Laan van Ooit"
    street_number "123"
    post_code "1111 AB"
    city "Some City"
    
    trait :wrong_street_number do
      street_number "111"
    end
    
    factory :user_without_street_number, traits: [:wrong_street_number]
  end
end