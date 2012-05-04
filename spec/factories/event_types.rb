# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_type do
    name "MyString"
    multiplier=int "MyString"
    description=string "MyString"
  end
end
