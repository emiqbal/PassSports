class RentalsController < ApplicationController
  
  def index  #this is all rentals here current user = user
    @rentals = Rental.where(user: current_user) 
  end

  def new
    @equipment = Equipment.find(params[:equipment_id])
    @user = current_user
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.equipment = Equipment.find(params[:equipment_id])
    days = (@rental.end_date - @rental.start_date).to_i + 1
    price_per_day = @rental.equipment.price_per_day
    @rental.price = price_per_day * days
    if @rental.save
      # TODO: redirect to rental show page
      redirect_to root_path
    else
      render :new
      # new redirect to create new form
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
