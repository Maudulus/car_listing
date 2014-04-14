require 'spec_helper'

feature 'real estate associate adds building', %q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
  } do

  scenario 'salesperson adds a car with valid attributes' do
    car = FactoryGirl.build(:car)
    count = Car.count

    visit new_car_path
    new_car_helper(car)
    click_on 'Add Car'

    expect(Car.count).to eq(count+1)
    expect(page).to have_content("Car Successfully Added")
    expect(current_path).to eq new_car_path
  end

  scenario 'salesperson adds a car with invalid attributes' do
    car = FactoryGirl.build(:car)
    count = Car.count

    visit new_car_path
    new_car_helper(car)
    fill_in "Color", with: ""
    click_on 'Add Car'

    expect(Car.count).to eq(count)
    expect(page).to have_content("Car Not Added")
    expect(current_path).to eq cars_path
  end

end
