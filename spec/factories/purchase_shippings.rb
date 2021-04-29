FactoryBot.define do
  factory :purchase_shipping do
    postal_num      { "123-4567" }
    prefecture_id   { 3 }
    municipality    { "大阪" }
    address         { "テスト" }
    building        { "テスト" }
    tel_num         { "11122223333" }
  end
end
