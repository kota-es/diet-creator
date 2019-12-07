class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:shops).order(params[:sort])
  end 
    
  def new
    @item = current_user.items.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      flash[:notice] = "商品「#{@item.name}」の登録が完了しました"
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @reviews = @item.reviews.includes(:user).order("created_at DESC")
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "商品「#{@item.name}」の更新が完了しました"
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if @item.user_id == current_user.id
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :genre_id, {:shop_ids => []}, :price, :kcal, :protein, :fat, :carb, :salt, :note)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
