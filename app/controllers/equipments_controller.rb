class EquipmentsController < ApplicationController
  def index
    @equipment = Equipment.all
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def new
    @user = current_user
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(params[:equipment])
    @equipment.save
    redirect_to equipment_path(@equipment)
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :description, :price_per_day)
  end
end
