module Nutrition
  class NutrientValue < ActiveRecord::Base
    # create_nutrition_nutrient_values makes nutrition_food_id and
    # nutrition_nutrient_id. Inferring food_id and nutrient_id meant
    # neither association could resolve, across 2,640,433 rows.
    belongs_to :food, foreign_key: :nutrition_food_id
    belongs_to :nutrient, foreign_key: :nutrition_nutrient_id
  end
end
