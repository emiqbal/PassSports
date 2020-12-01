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
end
