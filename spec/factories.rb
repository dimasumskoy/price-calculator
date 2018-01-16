FactoryBot.define do
  factory :city do
    name 'Москва'
    area
  end

  factory :area do
    sequence(:area)
    sequence(:price)
  end
end