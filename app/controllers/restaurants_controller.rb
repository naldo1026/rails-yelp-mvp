class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(res_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

private

  def res_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end


  # def create
  #   @review = Review.new(review_params)
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @review.restaurant = @restaurant
  #   if @review.save
  #     redirect_to restaurant_path(@restaurant)
  #   else
  #     render :new
  #   end
  # end