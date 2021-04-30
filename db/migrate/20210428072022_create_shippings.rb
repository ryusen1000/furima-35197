class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :postal_num,    nill: false
      t.integer    :prefecture_id, nill: false
      t.string     :municipality,  nill: false
      t.string     :address,       nill: false
      t.string     :building
      t.string     :tel_num,       nill: false
      t.references :purchase ,     nill: false, foreign_key: true
      t.timestamps
    end
  end
end
