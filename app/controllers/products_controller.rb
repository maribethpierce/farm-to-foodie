class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @user = current_user
    # @farm = Farm.find(params[:id])
    if params[:search]
      @products = Product.search(params[:search])#.page #params[:page]
    else
      @products = Product.order(:name)#.page #params[:page]
    end
  end

  def new
    @farm = Farm.find(params[:farm_id])
    @product = Product.new
    @user = current_user
  end

  def create
    @user = current_user
    if @user.farmer? == true
      @farm = @user.farm
      @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "Product added!"
        redirect_to user_farm_path(@user, @farm)
      else
        flash[:errors] = @product.errors.full_messages.join(', ')
        render :new
      end
    end
  end

  def edit
    @farm = Farm.find(params[:id])
    @user = current_user
    @products = @farm.products
    @product = Product.find(params[:id])
  end

  def update
    @farm = Farm.find(params[:id])
    @user = current_user
    @products = @farm.products
    @product = Product.find(params[:id])
    if @farm.user != @user
      flash[:notice] = "You don't have permission to edit this!"
      redirect_to :root_path
    end
    if @product.update(product_params)
      flash[:notice] = "Successfully updated"
      redirect_to farm_path(@farm)
    else
      flash[:errors] = @product.errors.full_messages.join(', ')
      render :new
    end
  end

    def destroy
      @farm = Farm.find(params[:id])
      @user = current_user
      @product = Product.find(params[:id])
      if @farm.user != @user
        flash[:notice] = "You don't have permission to delete this!"
        redirect_to :root_path
      end
      if @product.destroy
        flash[:notice] = "#{@product.item} deleted"
        redirect_to farm_path(@farm)
      end
    end

private

  def product_params
    params.require(:product).permit(
    :item,
    :quantity,
    :price,
    :expiration
    ).merge(farm_id: @farm.id)
  end

end
