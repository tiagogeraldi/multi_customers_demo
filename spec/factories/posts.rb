FactoryBot.define do
  factory :post do
    title { Faker::Cat.name }
    content { Faker::Cat.registry }
  end
end
