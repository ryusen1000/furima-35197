FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.free_email }
    password               { "aaa111" }
    password_confirmation  { password }
    gimei = Gimei.name
    first_name             { gimei.first.kanji }
    family_name            { gimei.last.kanji }
    first_name_kana        { gimei.first.katakana }
    family_name_kana       { gimei.last.katakana }
    birth                  { "1930-01-01" }
  end
end
