class RentalsController < ApplicationController
  
  def index  #this is all rentals here current user = user
    @rentals = Rental.where(user: current_user) 
  end

  def new
    @user = current_user
    @rental = Rental.new
  end

  def create
    # @rental = Rental.new(rental_params)
    # @rental.user = current_user
    # rental,price_per_day * (end_date - start_date)
  end
end
