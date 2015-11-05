module Nutrition
  class NutrientValue < ActiveRecord::Base
    belongs_to :food
    belongs_to :nutrient
  end
end
