class FarmsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @farms = Farm.all
    @user = current_user
  end

  def show
    @farm = Farm.find(params[:id])
    @market = @farm.markets
    @user = @farm.user
    @lat = @farm.latitude
    @lng = @farm.longitude
    # gon.lat = @farm.latitude
    # gon.lat = @farm.longitude
    # @produce = @farm.products
  end

  def new
    @farm = Farm.new
    @user = current_user
  end

  def create
    @user = current_user
    if current_user.farmer? == true
      @farm = Farm.new(farm_params)
      @farm.latitude = @farm.geocode.first
      @farm.longitude = @farm.geocode.last
      # @farm.users << current_user
      if @farm.save
        flash[:notice] = "Farm added!"
        redirect_to root_path
      else
        flash[:errors] = @farm.errors.full_messages.join(', ')
        render :new
      end
    else
      flash[:notice] = "You are not listed as a farmer!"
      redirect_to root_path
    end
  end

  def edit
    @farm = Farm.find(params[:id])
    @user = current_user
  end

  def update
    @farm = Farm.find(params[:id])
    @user = current_user
    if @farm.user != current_user
      flash[:notice] = "You don't have permission to edit this farm!"
      redirect_to root_path
    end
    if @farm.update(farm_params)
      flash[:notice] = "Farm updated!"
      redirect_to farm_path(@farm)
    else
      flash[:errors] = @farm.errors.full_messages.join('. ')
      redirect_to farm_path(@farm)
    end
  end

  def destroy
    @farm = Farm.find(params[:id])
    if @farm.destroy
      flash[:notice] = "Farm deleted"
      redirect_to root_path
    end
  end

  private

  def farm_params
    params.require(:farm).permit(
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

  # def user_params
  #   params.require(:group).permit(:user_id)
  # end

end
