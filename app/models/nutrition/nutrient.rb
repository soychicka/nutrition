module Nutrition
  class Nutrient < ActiveRecord::Base
    has_many :nutrition_nutrient_values
    has_many :foods, :through => :nutrition_nutrient_values
  end
end
