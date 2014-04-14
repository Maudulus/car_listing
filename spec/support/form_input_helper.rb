module FormHelper

  def new_car_helper(valid_attrs)
    fill_in 'Color', with: valid_attrs.color
    fill_in 'Year', with: valid_attrs.year
    fill_in 'Mileage', with: valid_attrs.mileage
    fill_in 'Description', with: valid_attrs.description
  end

end
