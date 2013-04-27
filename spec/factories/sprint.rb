FactoryGirl.define do
  factory :sprint do
    sequence :start_date do |n|
      (15 * n).days.since
    end
    sequence :end_date do |n|
      (30 * (0.5 + 0.5 * n)).days.since
    end
    product
  end
end
