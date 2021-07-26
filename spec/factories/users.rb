FactoryBot.define do
  factory :user do
    nickname { 'ben' }
    email	               { Faker::Internet.free_email }
    password             { '000aaa' }
    password_confirmation { '000aaa' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { '1931-01-01' }
  end
end
