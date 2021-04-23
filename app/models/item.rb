class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :item_status, :ship_cost, :prefecture, :days_to_ship
  
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name, :text, :price, :image

    with_options numericality: { other_then: 1 } do
      validates :category_id, :item_status_id, :ship_cost_id, :prefecture_id, :days_to_ship_id
    end

  end
end
