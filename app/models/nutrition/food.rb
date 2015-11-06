module Nutrition
  class Food < ActiveRecord::Base
    belongs_to :food_group
    has_many :masses, :foreign_key => :nutrition_food_id
    has_and_belongs_to_many :langual_factors
  end
end
