FactoryBot.define do
  factory :item do
    name                  {"肉巻きおにぎり"}
    image                 {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/spec_test.png'))}
    price                 {130}
    kcal                  {300}
    protein               {10.5}
    fat                   {20}
    carb                  {31.3}
    salt                  {0.6}
    note                  {"美味しい"}
    genre_id              {1}
  end
end
