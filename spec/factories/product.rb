FactoryGirl.define do
  factory :product do
    sequence :label do |n|
      "My project #{n}"
    end

    ignore do
      stories_count 0
    end

    ignore do
      sprints_count 0
    end

    # the after(:create) yields two values; the product instance itself and the
    # evaluator, which stores all values from the factory, including ignored
    # attributes; `create_list`'s second argument is the number of records
    # to create and we make sure the product is associated properly to sprints and products
    after(:create) do |product, evaluator|
      FactoryGirl.create_list(:story, evaluator.stories_count, product: product)
      FactoryGirl.create_list(:sprint, evaluator.sprints_count, product: product)
    end

    trait :with_stories do
      stories_count 5
    end

    trait :with_sprints do
      sprints_count 3
    end

    factory :product_with_stories, traits: [:with_stories]
    factory :product_with_sprints, traits: [:with_sprints]
    factory :product_with_stories_and_sprints, traits: [:with_stories, :with_sprints]
  end
end
