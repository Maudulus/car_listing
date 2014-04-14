class CarsController < ApplicationController

  def new
    @car = Car.new
  end

  def create
    @car = Car.create(car_params)
    if @car.save
      redirect_to new_car_path, notice: 'Car Successfully Added'
    else
      flash.now[:error] = 'Car Not Added'
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description)
  end

end
