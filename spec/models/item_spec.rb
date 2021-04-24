require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "出品商品登録" do
    context "出品登録できるパターン" do
      it "全て条件通りの入力をすると新規登録できる" do
        expect(@item).to be_valid
      end
    end

    context "出品登録できないパターン" do
      it "商品名がないと登録できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it "商品画像がないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品詳細がないと登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it"カテゴリーを選ばないと登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態を選ばないと登録できない" do
        @item.item_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 1")
      end

      it "配送料の負担を選ばないと登録できない" do
        @item.ship_cost_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship cost must be other than 1")
      end

      it "発送元の地域を選ばないと登録できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "発送までの日数を選ばないと登録できない" do
        @item.days_to_ship_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end

      it "販売価格がないと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "販売価格が全角数字だと登録できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が半角英字だと登録できない" do
        @item.price = "yoshida"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が半角カタカナだと登録できない" do
        @item.price = "ﾖｼﾀﾞ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が全角ひらがなだと登録できない" do
        @item.price = "よしだ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が全角カタカナだと登録できない" do
        @item.price = "ヨシダ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が全角漢字だと登録できない" do
        @item.price = "吉田"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が299円より小さいと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "販売価格が9,999,999円を超えると登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

    end
  end























end