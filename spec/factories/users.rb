FactoryBot.define do
  
  factory :user do
    name                  {"spec_user"}
    email                 {"spec@gmail.com"}
    password              {"1q2w3e4"}
    password_confirmation {"1q2w3e4"}
    image                 {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/spec_test.png'))}
    gender                {"male"}
    height                {170.5}
    weight                {61.5}
    pal                   {1.5}
    birthday              {"1990-1-1"}
  end
end