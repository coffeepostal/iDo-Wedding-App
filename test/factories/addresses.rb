# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
      guest nil
      line1 "MyString"
      line2 "MyString"
      city "MyString"
      state_code ""
      country_code "MyString"
      province_code "MyString"
      additional_names "MyString"
    end
end