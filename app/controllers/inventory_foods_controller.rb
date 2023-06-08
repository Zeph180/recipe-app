class InventoryFoodsController < ApplicationController
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
    redirect_to inventory_path(params[:inventory_id])
  end

  def destroy
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy

    respond_to do |format|
      format.html { redirect_to inventory_path(@inventory.id), notice: 'Food was successfully deleted' }
      format.json { head :no_content }
    end
  end

  def new
    @user = current_user
    @foods = Food.all
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:food_id, :quantity).merge(params.slice(:inventory_id).permit(:inventory_id))
  end
end
