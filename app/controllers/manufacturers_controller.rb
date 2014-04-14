class ManufacturersController < ApplicationController

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.create(manufacturer_params)
    if @manufacturer.save
      redirect_to new_manufacturer_path, notice: 'Manufacturer Successfully Added'
    else
      flash.now[:error] = 'Manufacturer Not Added'
      render :new
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end

end
