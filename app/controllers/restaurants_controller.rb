class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @restaurants = Restaurant.all
    @user = current_user
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
    @lat = @restaurant.latitude
    @lng = @restaurant.longitude
  end

  def new
    @restaurant = Restaurant.new
    @user = current_user
  end

  def create
    @user = current_user
    if current_user.restaurant? == true
      @restaurant = Restaurant.new(restaurant_params)
        @restaurant.latitude = @restaurant.geocode.first
        @restaurant.longitude = @restaurant.geocode.last
      if @restaurant.save
        flash[:notice] = "Restaurant added!"
        redirect_to root_path
      else
        flash[:errors] = @restaurant.errors.full_messages.join(', ')
        render :new
      end
    else
      flash[:notice] = "You are not listed as a restaurant owner!"
      redirect_to root_path
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
    if @restaurant.user != current_user
      flash[:notice] = "You don't have permission to edit this restaurant!"
      redirect_to root_path
    end
    if @restaurant.update(restaurant_params)
      flash[:notice] = "Restaurant updated!"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:errors] = @restaurant.errors.full_messages.join('. ')
      redirect_to restaurant_path(@restaurant)
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.destroy
      flash[:notice] = "Restaurant deleted"
      redirect_to root_path
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(
    :name,
    :email,
    :phone,
    :address,
    :city,
    :state,
    :zip,
    :latitude,
    :longitude
    ).merge(user_id: current_user.id)
  end

end
