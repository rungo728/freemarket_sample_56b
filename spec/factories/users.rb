FactoryBot.define do
  factory :user do
    nickname {"小島毅"}
    email {"tekitou@gmail.com"}
    last_name {"小島"}
    first_name {"毅"}
    last_name_kana {"コジマ"}
    fisrst_name_kana {"タケシ"}
    birthday {"1998-01-01"}
    phone_number {"21212121212"}
    prefecture_id {10}
    city {"渋谷区"}
    address {"1-1"}
    building {"aaa"}
    phone_number_sub {"21212121212"}
    profile {"ヤッホー"}
    point {"0"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end