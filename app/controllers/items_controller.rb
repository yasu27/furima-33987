class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    <#% 商品一覧機能の実装範囲 @item = Item.all >
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :delivery_id, :prefecture_id, :day_id, :price, :image :user_id)
  end
end
