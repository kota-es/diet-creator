class ListsController < ApplicationController
  before_action :setup_list_item, only: [:add_item]

  def show
    @lists = current_list.list_items.all
  end

  def add_item
    @list_item = current_list.list_items.new(item_id: params[:item_id])
    @list_item.save
    flash[:notice] =  "#{@list_item.item.name}を食事予定に追加しました"
    redirect_back(fallback_location: root_path) 
  end

  def delete_item
    @list_item = current_list.list_items.find(params[:id])
    @list_item.destroy 
    flash[:notice] =  "#{@list_item.item.name}を食事予定から削除しました"
    redirect_back(fallback_location: root_path) 
  end

  private

  def setup_list_item
    @list_item = current_list.list_items.find_by(item_id: params[:item_id])
  end

end
