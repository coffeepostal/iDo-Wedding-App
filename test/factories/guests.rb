# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :guest do
      honorific "MyString"
      first_name "MyString"
      last_name "MyString"
      name_suffix "MyString"
      email "MyString"
      pin "MyString"
    end
end