class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order(params[:sort])
  end 
    
  def new
    @item = current_user.items.new
  end

  def create
    @item = current_user.items.new(item_params
      # name: item_params[:name],
      # image: item_params[:image],
      # genre_id: item_params[:genre_id].to_i,
      # shop_id: item_params[:shop_id].to_i,
      # price: item_params[:price],
      # kcal: item_params[:kcal],
      # protein: item_params[:protein],
      # fat: item_params[:fat],
      # carb: item_params[:carb],
      # salt: item_params[:salt],
      # note: item_params[:note],
      # user_id: current_user.id
      )
    if @item.save
      flash[:notice] = "商品「#{@item.name}」の登録が完了しました"
      redirect_to root_path
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
      redirect_to root_path
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

end
