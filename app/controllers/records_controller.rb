class RecordsController < ApplicationController

  def index
    @records = current_user.record.record_items.includes(:item).order("id DESC")
  end

  def create
    @record = Record.find_by(user_id: current_user.id)  
    item_ids.each do |item_id|
      @record_items = RecordItem.create(record_id: @record.id, item_id: item_id)
    end
    current_list.destroy
    flash[:notice] = "食事記録を更新しました"
    redirect_to root_path    
  end

  private

  def item_ids
    item_ids = []
    current_list.list_items.each do |list|
      item_id = list.item.id
      item_ids << item_id
    end
    return item_ids
  end

end