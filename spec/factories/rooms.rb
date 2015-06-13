FactoryGirl.define do
  factory :room do
    top false
    left false
    right false
    bottom false

    trait :top do
      top true
    end

    trait :left do
      left true
    end

    trait :right do
      right true
    end

    trait :bottom do
      bottom true
    end

    factory :top_room,           traits: [:top]
    factory :top_left_room,      traits: [:top, :left]
    factory :top_right_room,     traits: [:top, :right]

    factory :left_room,          traits: [:left]
    factory :right_room,         traits: [:right]

    factory :bottom_room,        traits: [:bottom]
    factory :bottom_left_room,   traits: [:bottom, :left]
    factory :bottom_right_room,  traits: [:bottom, :right]
  end
end
