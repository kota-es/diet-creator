class ReviewsController < ApplicationController

  before_action :set_item, only: [:new, :create, :edit]
  before_action :set_my_review, only: [:edit, :update, :destroy]

  def new
    @review = @item.reviews.new
  end

  def create
    @review = @item.reviews.new(review_params)
    if @review.save
      redirect_to items_path
    else
      render :new
    end      
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to items_path
    else
      render :new
    end  
  end

  def destroy
    @review.destroy
    redirect_to root_path
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
