# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :RSVP do
      guest nil
      attending false
      number_attending 1
      max_number_attending 1
      group_rsvp false
      admin_rsvp false
    end
end