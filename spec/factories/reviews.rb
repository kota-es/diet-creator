FactoryBot.define do
  factory :review do
    taste   {Faker::Number.within(range: 1..5)}
    volume  {Faker::Number.within(range: 1..5)}
    comment {Faker::Lorem.paragraphs}
    item
    user
  end
end
