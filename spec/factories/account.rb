FactoryGirl.define do
  factory :account do

    sequence(:name)   { |n| "Person #{n}" }
    sequence(:email)  { |n| "person_#{n}@test.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin false
    end
  end
end