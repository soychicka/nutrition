module Nutrition
  class Nutrient < ActiveRecord::Base
    has_many :nutrient_values
    has_many :foods, :through => :nutrient_values
  end
end
