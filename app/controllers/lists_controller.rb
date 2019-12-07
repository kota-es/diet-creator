class ListsController < ApplicationController
  before_action :setup_list_item, only: [:add_item]

  def add_item
    @list_item = current_list.list_items.new(item_id: params[:item_id])
    @list_item.save
    flash[:notice] =  "#{@list_item.item.name}を食事予定に追加しました"
    redirect_to items_path
  end

  private

  def setup_list_item
    @list_item = current_list.list_items.find_by(item_id: params[:item_id])
  end

end
