# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
      guest nil
      line1 "MyString"
      line2 "MyString"
      city "MyString"
      zip "MyString"
      state_code "MyString"
      country_code "MyString"
      province_code "MyString"
    end
end