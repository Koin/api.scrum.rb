FactoryGirl.define do
  factory :story do
    sequence :label do |n|
      "My story #{n}"
    end
    sequence :order
    product
  end
end
