class ReviewsController < ApplicationController

  before_action :set_item, only: [:new, :create]

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
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to items_path
    else
      render :new
    end  
  end

  def destroy
    binding.pry
    @review = Review.find(params[:id])
    @review.destroy if @review.user == current_user
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:taste, :volume, :comment).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
