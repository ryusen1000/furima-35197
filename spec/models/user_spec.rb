require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるパターン" do
      it "全て条件通りの入力をすると新規登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できないパターン" do
      it "ニックネームがないと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "メールアドレスがないと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "同じメールアドレスがあると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it"メールアドレスは、@を含まないと登録できない" do
        @user.email = "aaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "パスワードがないと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "パスワードは、6文字以上での入力が必須であること（6文字が入力されていないと登録できない）" do
        @user.password = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードは、半角英数字混合での入力が必須であること（英字のみでは登録できない）" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードは、半角英数字混合での入力が必須であること（数字のみでは登録できない）" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードは、確認用を含めて2回入力すること" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "パスワードとパスワード（確認用）は、値が一致しないと登録できない" do
        @user.password_confirmation = "aaaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "ユーザー本名は、名字が入力されないと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "ユーザー本名は、名前が入力されないと登録できない" do
        @user.first_name = ''
        
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）での入力がないと登録できない" do
        @user.family_name = "yoshida"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it "ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）での入力がないと登録できない" do
        @user.first_name = "yoshida"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "ユーザー本名のフリガナは、名字が入力されないと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it "ユーザー本名のフリガナは、名前が入力されないと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "ユーザー本名のフリガナの名字は、全角（カタカナ）での入力がないと登録できない" do
        @user.family_name_kana = "yoshida"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it "ユーザー本名のフリガナの名前は、全角（カタカナ）での入力がないと登録できない" do
        @user.first_name_kana = "yoshida"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "生年月日がないと登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
