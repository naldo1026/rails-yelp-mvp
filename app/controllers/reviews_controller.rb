class ReviewsController < ApplicationController

  def new 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
     if @review.save
      #redirects to the show page if it saves
      redirect_to restaurant_path(@restaurant)
    else
      #stays on the page if it doesnt go through
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end