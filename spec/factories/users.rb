FactoryBot.define do
  
  factory :user do
    name                  {Faker::Name.name}
    sequence(:email)      {|n| "spec#{n}@gmail.com"}
    password              {"1q2w3e4"}
    password_confirmation {"1q2w3e4"}
    image                 {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/spec_test.png'))}
    gender                {["male", "female"].sample}
    height                {Faker::Number.decimal(l_digits: 3, r_digits: 1)}
    weight                {Faker::Number.decimal(l_digits: 3, r_digits: 1)}
    pal                   {[1.5, 1.75, 2.0].sample}
    birthday              {Faker::Date.birthday}
  end
  
end