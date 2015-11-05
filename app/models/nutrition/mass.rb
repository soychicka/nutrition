module Nutrition
  class Mass < ActiveRecord::Base
    belongs_to :food
  end
end
