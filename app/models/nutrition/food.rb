module Nutrition
  class Food < ActiveRecord::Base
    belongs_to :food_group
  end
end
