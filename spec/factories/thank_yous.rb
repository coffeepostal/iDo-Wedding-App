FactoryGirl.define do
  factory :thank_you do
    gift
    note { F::LoremIpsum.sentence :rand => true }
  end
end
