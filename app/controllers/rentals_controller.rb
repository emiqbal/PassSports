class RentalsController < ApplicationController

  def index  #this is all rentals here current user = user
    today = Date.today
    @rentals = Rental.where(user: current_user)
    @future_rentals = @rentals.where("start_date > ?", today)
    @past_rentals = @rentals.where("end_date < ?", today)
    @current_rentals = @rentals.where("start_date < ? AND end_date > ?", today, today )
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
      redirect_to rentals_path
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
