class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    Shipping.create(shipping_params)
    if
    redirect_to root_path
  end

  private


  def purchase_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def shipping_params
    params.permit(:postal_num, :prefecture_id, :municipality, :address, :building, :tel_num).merge(purchase_id: @purchase.id)
  end

end
