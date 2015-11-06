module Nutrition
  class Mass < ActiveRecord::Base
    belongs_to :food, :foreign_key => :nutrition_food_id
  end
end
