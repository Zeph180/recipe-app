class InventoryFoodsController < ApplicationController
  before_action :set_user
  before_action :set_inventory
  def create
    @user = current_user
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = InventoryFood.new(params.require(:inventory_food).permit(:quantity, :inventory_id, :food_id))
    @inventory_food.inventory_id = @inventory.id
    if @inventory_food.save
      flash[:notice] =
        'Inventory food saved successfully'
    else
      flash[:alert] = 'Inventory food not saved'
    end
    redirect_to user_inventory_path(current_user, params[:inventory_id])
  end

  def destroy
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy

    redirect_to user_inventory_path(@user, @inventory.id), notice: 'Food was successfully deleted'
  end

  def new
    @user = current_user
    @foods = Food.all
  end

  private

  def set_user
    @user = User.includes(:inventories).find(params[:user_id])
  end

  def set_inventory
    @inventory = @user.inventories.find(params[:inventory_id])
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:food_id, :quantity).merge(params.slice(:inventory_id).permit(:inventory_id))
  end
end
