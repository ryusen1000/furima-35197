class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(
      :postal_num,
      :prefecture_id,
      :municipality,
      :address,
      :building,
      :tel_num,
      :item_id,
      :purchase_id
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
