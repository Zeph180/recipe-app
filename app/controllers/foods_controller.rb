class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
    @user = current_user
  end

  def create
    @user = current_user
    @food = Food.new(params.require(:food).permit(:name, :measurement_unit, :price))
    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'food has been successfully save' }
        format.json { render :show, status: :created, location: @food }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_path, notice: 'foor was successfully deleted' }
      format.json { head :no_content }
    end
  end
end
