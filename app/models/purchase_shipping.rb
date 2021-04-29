class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_num, :prefecture_id, :municipality, :address, :building,
                :tel_num, :user_id, :item_id, :purchase_id

  with_options presence: true do
    validates :municipality, :address, :user_id, :item_id
    
    with_options format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" } do
      validates :postal_num
    end

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :prefecture_id
    end

    validates :tel_num, numericality: { only_integer: true }, length: { maximum: 11 }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(
      postal_num: postal_num,
      prefecture_id: prefecture_id,
      municipality: municipality,
      address: address,
      building: building,
      tel_num: tel_num,
      purchase_id: purchase.id
    )
  end
end