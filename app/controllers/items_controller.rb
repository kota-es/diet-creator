class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品「#{@item.name}」の更新が完了しました"
      redirect_to root_path
    else
      render :edit
    end
  end

  def item_params
    params.require(:item).permit(:name, :image, :genre_id, {:shop_ids => []}, :price, :kcal, :protein, :fat, :carb, :salt, :note).merge(user_id: current_user.id)
  end

end
