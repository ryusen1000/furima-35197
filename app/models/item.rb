class Item < ApplicationRecord
  belongs_to :user


  with_options presence: true do
    validates :item_name, :text, :category_id, :item_status_id,
              :ship_cost_id, :prefecture_id, :days_to_ship_id, :price, :image
  end
end
