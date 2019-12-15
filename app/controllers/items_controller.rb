class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true).order("created_at DESC")
  end 

  def search
    @q = Item.search(search_params)
    @items = @q.result(distinct: true).order("created_at DESC")
  end 
    
  def new
    @item = current_user.items.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to items_path, notice: "商品「#{@item.name}」の登録が完了しました"
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
      redirect_to items_path, notice: "商品「#{@item.name}」の更新が完了しました"
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :genre_id, {:shop_ids => []}, :price, :kcal, :protein, :fat, :carb, :salt, :note)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_params
    params.require(:q).permit(:name_cont, :genre_id_eq, :shops_id_eq)
  end

end
