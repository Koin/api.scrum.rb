FactoryGirl.define do
  factory :story do
    sequence :label do |n|
      "My story #{n}"
    end
    product
  end
end
