FactoryBot.define do
  factory :food1, class: "Food" do
    name { "Cocktail" }
    measurement_unit { "litres" }
    price { 5.00 }
    quantity { 1 }
    association :user, factory: :user
  end

  factory :food2, class: "Food"  do
    name { "Burger" }
    measurement_unit { "grams" }
    price { 8.00 }
    quantity { 2 }
    association :user, factory: :user
  end
end
