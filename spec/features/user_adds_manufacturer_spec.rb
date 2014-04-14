require 'spec_helper'

feature 'used car salesperson specifies manufacturer (optionally)', %q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
  } do

    scenario 'salesperson adds a car with valid attributes' do
      manufacturer = FactoryGirl.build(:manufacturer)
      count = Manufacturer.count

      visit new_manufacturer_path
      new_manufacturer_helper(manufacturer)
      select('United Kingdom', from: 'manufacturer_country')
      click_on 'Add Manufacturer'

      expect(Manufacturer.count).to eq(count+1)
      expect(page).to have_content("Manufacturer Successfully Added")
      expect(current_path).to eq new_manufacturer_path
    end

    scenario 'salesperson adds a car with invalid attributes' do
      manufacturer = FactoryGirl.build(:manufacturer)
      count = Manufacturer.count

      visit new_manufacturer_path
      new_manufacturer_helper(manufacturer)
      click_on 'Add Manufacturer'

      expect(Manufacturer.count).to eq(count)
      expect(page).to have_content("Manufacturer Not Added")
      expect(current_path).to eq manufacturers_path
    end
end
