FactoryGirl.define do
  factory :player do
    trait :mid_strength do
      strength 20
    end

    trait :high_strength do
      strength 50
    end

    trait :mid_speed do
      speed 20
    end

    trait :high_speed do
      speed 50
    end

    trait :mid_luck do
      luck 20
    end

    trait :high_luck do
      luck 50
    end

    factory :player_high,        traits: [:high_strength, :high_speed, :high_luck]
    factory :player_mismatched,  traits: [:high_speed, :mid_luck]
  end
end
