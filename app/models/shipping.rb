class Shipping < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :municipality, :address
    
    with_options format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
      validates :postal_num
    end
    :tel_num

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :prefecture_id
    end

    with_options numericality: { only_integer: true, maxmum_charactmessage: "is invalid" }
  end

end
