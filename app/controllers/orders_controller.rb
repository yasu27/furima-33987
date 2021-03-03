class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :set_order

  def index
    @form_object = FormObject.new
  end

  def create
    @form_object = FormObject.new(form_object_params)
    if @form_object.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: form_object_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @form_object.save
      redirect_to root_path
    else
      render :index
    end
  end

  def order
    @item = Item.find(params[:item_id])
    redirect_to new_card_path and return unless current_user.card.present?

    redirect_to root_path
  end


  private
  def form_object_params
    params.require(:form_object).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
    end
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end

