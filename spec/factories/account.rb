FactoryGirl.define do
  factory :account do

    sequence(:name)   { |n| "Family #{n} Account" }
    sequence(:email)  { |n| "family_#{n}@test.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin false
    end
  end
end