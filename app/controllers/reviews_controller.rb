class ReviewsController < ApplicationController

  before_action :set_item, only: [:new, :create, :edit]
  before_action :set_my_review, only: [:edit, :update, :destroy]

  def new
    @review = @item.reviews.new
  end

  def create
    @review = @item.reviews.new(review_params)
    if @review.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to item_path(@item)
    else
      render :new
    end      
  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:notice] = "レビューを編集しました"
      redirect_to item_path(@item)
    else
      render :new
    end  
  end

  def destroy
    @review.destroy
    flash[:notice] = "レビューを投稿しました"
    redirect_to item_path(@item)
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
  end

end
