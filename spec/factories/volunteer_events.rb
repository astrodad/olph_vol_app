# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :volunteer_event do
    name "MyString"
    event_date "2012-04-30"
    hours_worked ""
  end
end
