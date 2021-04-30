require 'rails_helper'
RSpec.describe PurchaseShipping, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user, item_id: item)
      sleep 0.033
    end

    context '購入登録できるパターン' do
      it '全て条件通りの入力をすると購入できる' do
        expect(@purchase_shipping).to be_valid
      end
      it '建物名はなくても購入できる' do
        @purchase_shipping.building = ""
        expect(@purchase_shipping).to be_valid
      end
    end

    context '購入登録できないパターン' do
      it 'クレジットカード情報は必須であり、tokenがなければ登録できないこと' do
        @purchase_shipping.token = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が必須であること' do
        @purchase_shipping.postal_num = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal num can't be blank")
      end

      it '郵便番号の保存にはハイフンが必要である' do
        @purchase_shipping.postal_num = "1234567"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal num is invalid. Include hyphen(-)")
      end
      it '都道府県が必須である' do
        @purchase_shipping.prefecture_id = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が--では登録できない' do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が必須である' do
        @purchase_shipping.municipality = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が必須である' do
        @purchase_shipping.address = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須である' do
        @purchase_shipping.tel_num = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Tel num can't be blank")
      end
      it '電話番号は11桁以内の数値のみ保存可能である' do
        @purchase_shipping.tel_num = "111222233334"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Tel num is too long (maximum is 11 characters)")
      end
      it '電話番号は半角英字だと登録できない' do
        @purchase_shipping.tel_num = "aaaaaaaaaaa"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Tel num is not a number")
      end
      it '電話番号は半角カタカナだと登録できない' do
        @purchase_shipping.tel_num = "ﾖｼﾀﾞﾖｼﾀﾞﾖｼﾀﾞﾖｼ"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Tel num is not a number")
      end
      it '電話番号は全角数字だと登録できない' do
        @purchase_shipping.tel_num = "１１１２２２２３３３３"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Tel num is not a number")
      end
      it '電話番号は全角漢字だと登録できない' do
        @purchase_shipping.tel_num = "吉田吉田吉田吉田吉田吉"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Tel num is not a number")
      end
      it '電話番号は全角カタカナだと登録できない' do
        @purchase_shipping.tel_num = "ヨシダヨシダヨシダヨシ"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Tel num is not a number")
      end
      it '電話番号は全角ひらがなだと登録できない' do
        @purchase_shipping.tel_num = "よしだよしだよしだよし"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Tel num is not a number")
      end
      it 'userが紐づいていないと登録できない' do
        @purchase_shipping.user_id = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと登録できない' do
        @purchase_shipping.item_id = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
