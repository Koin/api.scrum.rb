FactoryGirl.define do
  factory :story do
    label "My story"
    association :product, factory: :product
  end
end
