FactoryGirl.define do
  factory :gift do
    guest
    gift        { "#{F::Name.company_name} #{F::LoremIpsum.words(rand(3) + 1, :rand => true)}" }
    description { sometimes(0.5, F::LoremIpsum.sentence(:rand => true)) }
    notes       { sometimes(0.5, F::LoremIpsum.sentence(:rand => true)) }
  end
end
