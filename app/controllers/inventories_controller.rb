class InventoriesController < ApplicationController
  before_action :set_user

  def index
    @inventories = current_user.inventories.all
  end

  def create
    @user = current_user
    @inventory = @user.inventories.new(inventory_params)
    if @inventory.save
      redirect_to user_inventories_path(@user)
      flash[:notice] = 'Inventory created successfully'
    else
      redirect_to new_user_inventory(@user)
      flash[:alert] = 'Inventory could not be created'
    end
  end

  def destroy
    @inventory = current_user.inventories.find(params[:id])
    @inventory.destroy
    flash[:notice] = 'Inventory deleted successfully'
    redirect_to user_inventories_path(@user)
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
