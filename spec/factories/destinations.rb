FactoryBot.define do
  factory :destination do
    postal_code{111-1111}
    prefectures_id{5}
    municipalities{'京都市'}
    address{10}
    building_name{'ライオンズ'}
    telephone_number{19000000000}
  
    
    # association :user
    # association :item
  end
end
