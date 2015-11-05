require 'test_helper'

module Nutrition
  class FoodGroupTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end
    
    Nutrition::Engine.load_seed
  end
end
