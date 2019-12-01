FactoryBot.define do
  factory :user do
    id {1}
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password}
    profile {"ヤッホー"}
    point {"0"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end