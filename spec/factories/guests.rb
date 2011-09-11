  # Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :guest do
    honorific         'Mr.'
    first_name        'Dallas'
    last_name         'Reedy'
    name_suffix       'III'
    additional_names  'Nicole Reedy, Bossy'
    email             'code@dallasreedy.com'
    # pin               '' # should get auto-generated, right?
  end
end
