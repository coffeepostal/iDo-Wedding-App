# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gift do
      guest nil
      gift "MyString"
      description "MyText"
      notes "MyText"
    end
end