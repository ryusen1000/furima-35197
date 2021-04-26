FactoryBot.define do
  factory :item do
    item_name        { Faker::Name.name }
    text             { Faker::Lorem.sentence }
    category_id      { "2" }
    item_status_id   { "2" }
    ship_cost_id     { "2" }
    prefecture_id    { "2" }
    days_to_ship_id  { "2" }
    price            { "2000" }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
