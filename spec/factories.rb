FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
  end

  factory :admin, class: User do
    first_name "John"
    last_name "Doe"
  end

  factory :product do
    name "Kielbasa pastrami"
    description "Fatback kielbasa ground round boudin ham tenderloin. Chuck shankle jerky chicken."
    price 4.00
    retired false
  end

  factory :retired_product, class: Product do
    name "Bacon ipsum dolor"
    description "Shankle short loin pork loin pork. Pastrami shank."
    price 2.00
    retired true
  end

end
