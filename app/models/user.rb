class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  with_options presence: true do
    validates :nickname, :birth

    with_options format: { with: /\A([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])\z/i } do
      validates :password, :password_confirmation
    end

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :first_name, :family_name
    end

    with_options format: { with: /\A[ァ-ヶ]+\z/ } do
    validates :first_name_kana, :family_name_kana
    end
  end

end
