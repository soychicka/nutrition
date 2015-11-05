module Nutrition
  class Food < ActiveRecord::Base
    belongs_to :food_group
    has_many :masses
    has_and_belongs_to_many :langual_factors
  end
end
