class MarketsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @farm = Farm.find(params[:id])
    @markets = @farm.markets
  end

  def show
    @farm = Farm.find(params[:id])
    @markets = @farm.markets
    @user = current_user
    @lat = @farm.latitude
    @lng = @farm.longitude
  end

  def new
    @farm = Farm.find(params[:farm_id])
    @market = Market.new
    @user = current_user
  end

  def create
    @user = current_user
    if @user.farmer? == true
      @farm = @user.farm
      @market = Market.new(market_params)
      if @market.save
        flash[:notice] = "Market added!"
        redirect_to user_farm_path(@user, @farm)
      else
        flash[:errors] = @market.errors.full_messages.join(', ')
        render :new
      end
    end
  end

  def edit
    @farm = Farm.find(params[:id])
    @user = current_user
    @markets = @farm.markets
    @market = Market.find(params[:id])
  end

  def update
    @farm = Farm.find(params[:id])
    @user = current_user
    @markets = @farm.markets
    @market = Market.find(params[:id])
    if @farm.user != @user
      flash[:notice] = "You don't have permission to edit this!"
      redirect_to :root_path
    end
    if @market.update(market_params)
      flash[:notice] = "Successfully updated"
      redirect_to farm_path(@farm)
    else
      flash[:errors] = @market.errors.full_messages.join(', ')
      render :new
    end
  end

    def destroy
      @farm = Farm.find(params[:id])
      @user = current_user
      @market = Market.find(params[:id])
      if @farm.user != @user
        flash[:notice] = "You don't have permission to delete this!"
        redirect_to :root_path
      end
      if @market.destroy
        flash[:notice] = "#{@market.item} deleted"
        redirect_to farm_path(@farm)
      end
    end

private

  def market_params
    params.require(:market).permit(
    :day_of_week,
    :location,
    :address,
    :city,
    :state,
    :zip
    ).merge(farm_id: @farm.id)
  end

end
