class ListsController < ApplicationController
  before_action :setup_list_item, only: [:add_item]

  def add_item
    if @list_item.blank?
      @list_item = current_list.list_items.new(item_id: params[:item_id])
    end

    @list_item.quantity += 1
    @list_item.save
    redirect_to root_path
  end

  private

  def setup_list_item
    @list_item = current_list.list_items.find_by(item_id: params[:item_id])
  end

end
