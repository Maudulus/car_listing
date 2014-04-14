class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :color, presence: true
  validates :year, presence: true,
    numericality: { greater_than_or_equal_to: 1979, less_than_or_equal_to: Date.current.year }
  validates :mileage, presence: true, numericality: true
end
