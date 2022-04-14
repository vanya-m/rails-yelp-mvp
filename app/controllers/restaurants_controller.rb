class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was sucessfully created'
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   if @restaurant.update(restaurant_params)
  #     redirect_to @restaurant, notice: 'Restaurant was sucessfully updated'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @restaurant.destroy
  #   redirect_to restaurants_path, notice: 'Restaurant was sucessfully deleted'
  # end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
