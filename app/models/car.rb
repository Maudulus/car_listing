class Car < ActiveRecord::Base
  validates :color, presence: true
  validates :year, presence: true
  validates :mileage, presence: true
end
