class ManufacturersController < ApplicationController

  def new
    @manufacturer = Manufacturer.new
  end

  def index
    @manufacturers = Manufacturer.all
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy

    redirect_to manufacturers_path
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

  def set_manufacturer
      @manufacturer = Manufacturer.find(params[:id])
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end

end
