class EquipmentsController < ApplicationController
  def index
    @equipment = Equipment.all
  end

  def show
    @equipment = Equipment.find(params[:id])
  
  def equipment_params
  params.require(:equipment).permit(:name, :description, :pay_per_day, :photo)
end
  end

  def new
    @user = current_user
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    user = current_user
    @equipment.user = user
    @equipment.price_per_day *= 100
    @equipment.save
    redirect_to equipment_path(@equipment)
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :description, :price_per_day)
  end
end
