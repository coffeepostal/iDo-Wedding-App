FactoryGirl.define do
  factory :rsvp do
    guest
    attending             { F::Basic.boolean }
    max_number_attending  { F::Basic.number :at_least => 1, :at_most => 6 }
    number_attending      { F::Basic.number :at_least => 1, :at_most => max_number_attending }
    group_rsvp            { F::Basic.boolean }
    admin_rsvp            { F::Basic.boolean }
  end
end
