class CarsController < ApplicationController

  def new
    @car = Car.new
  end

  def index
    @cars = Car.all
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

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description, :manufacturer_id)
  end

end
