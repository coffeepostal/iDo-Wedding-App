FactoryGirl.define do
  factory :address do
    guest
    line1         { F::Address.street_address }
    line2         { sometimes(0.3, F::Address.street_address) }
    city          { F::Address.city }
    zip           { F::Address.zip }
    state_code    { sometimes(0.9, F::Address.state_abbrev) }
    country_code  { state_code ? 'US' : F::Address.country }
    province_code { state_code ? nil : sometimes(0.3, F::Address.province_abbrev) }
  end
end
