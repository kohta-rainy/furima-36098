FactoryBot.define do
  factory :order do
    postal_code{'111-1111'}
    prefecture_id{5}
    municipalities{'京都市'}
    address{10}
    building_name{'ライオンズ'}
    telephone_number{19000000000}
    token{11111100}
  end
end