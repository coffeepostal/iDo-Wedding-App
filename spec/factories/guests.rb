FactoryGirl.define do
  factory :guest do
    honorific         { F::Name.title }
    first_name        { F::Name.first_name }
    last_name         { F::Name.last_name }
    name_suffix       { sometimes(0.25, F::Name.suffix) }
    additional_names  { sometimes(0.4, "#{F::Name.full_name}#{sometimes(0.4, ", #{F::Name.full_name}")}") }
    email             { "#{first_name}.#{last_name}@#{F::Internet.domain_name}" }
  end
end
