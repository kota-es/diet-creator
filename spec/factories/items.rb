FactoryBot.define do
  factory :item do
    name                  {Faker::Food.dish}
    image                 {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/spec_test.png'))}
    price                 {Faker::Number.number(digits: 4)}
    kcal                  {Faker::Number.number(digits: 4)}
    protein               {Faker::Number.decimal(l_digits: 2, r_digits: 1)}
    fat                   {Faker::Number.decimal(l_digits: 2, r_digits: 1)}
    carb                  {Faker::Number.decimal(l_digits: 2, r_digits: 1)}
    salt                  {Faker::Number.decimal(l_digits: 2, r_digits: 1)}
    note                  {Faker::Lorem.paragraphs}
    genre_id              {Faker::Number.within(range: 1..24)}
    user
  end
end
