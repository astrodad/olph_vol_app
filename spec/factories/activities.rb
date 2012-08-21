# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    activity "MyString"
    description "MyString"
    priority false
    visible false
    chair "MyString"
  end
end
