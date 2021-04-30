class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :ship_cost
  belongs_to :prefecture
  belongs_to :days_to_ship
  
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :item_name, :text, :image

    with_options numericality: { other_than: 1 } do
      validates :category_id, :item_status_id, :ship_cost_id, :prefecture_id, :days_to_ship_id
    end

    with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
      validates :price
    end
  end
end
