class ReviewsController < ApplicationController

  before_action :set_item, only: [:new, :create]
  before_action :set_my_review, only: [:edit, :update, :destroy]

  def new
    @review = @item.reviews.new
  end

  def create
    @review = @item.reviews.new(review_params)
    if @review.save
      redirect_to item_path(@item), notice: "レビューを投稿しました"
    else
      render :new
    end      
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to item_path(@review.item), notice: "レビューを更新しました"
    else
      render :edit
    end  
  end

  def destroy
    @review.destroy
    redirect_to item_path(@item), notice: "レビューを削除しました"
  end

  private

  def review_params
    params.require(:review).permit(:taste, :volume, :comment).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_my_review
    @review = current_user.reviews.find(params[:id])
    @item = @review.item
  end

end