FactoryGirl.define do
  factory :graph do

    trait :short do
      height 1
    end

    trait :narrow do
      width 3
    end

    factory :small_graph, traits: [:short, :narrow]
  end
end
