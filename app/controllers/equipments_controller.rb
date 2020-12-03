require 'open-uri'

class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user
    @equipment.price_per_day *= 100

    if @equipment.save
       if equipment_params[:photo].nil?
        query = @equipment.name.split(' ').join(',')
        url = "https://source.unsplash.com/720x480/?#{query}"
        image = URI.open(url)
        @equipment.photo.attach(io: image, filename: "equipment_#{@equipment.id}.jpeg", content_type: 'image/jpeg')
        # use unsplash
        end
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :description, :price_per_day, :photo)
  end
end
