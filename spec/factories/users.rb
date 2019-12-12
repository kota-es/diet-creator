FactoryBot.define do
  
  factory :user do
    password = Faker::Internet.password(min_length: 7, mix_case: true)
    name                  {Faker::Name.name}
    sequence(:email)      {|n| "spec#{n}@gmail.com"}
    password              {password}
    password_confirmation {password}
    image                 {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/spec_test.png'))}
    gender                {"male"}
    height                {Faker::Number.decimal(l_digits: 3, r_digits: 1)}
    weight                {Faker::Number.decimal(l_digits: 3, r_digits: 1)}
    pal                   {1.5}
    birthday              {Faker::Date.birthday}
  end
end