FactoryGirl.define do
  factory :sprint do
    start_date Time.now
    end_date 15.days.since
    association :product, factory: :product
  end
end
