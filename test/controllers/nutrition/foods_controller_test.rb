require 'test_helper'

module Nutrition
  class FoodsControllerTest < ActionController::TestCase
    setup do
      @food = nutrition_foods(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:foods)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create food" do
      assert_difference('Food.count') do
        post :create, food: { aliases: @food.aliases, carb_calorie_yield: @food.carb_calorie_yield, description: @food.description, fat_calorie_yield: @food.fat_calorie_yield, food_group_id: @food.food_group_id, is_complete: @food.is_complete, manufacturer: @food.manufacturer, nitrogen_protein_yield: @food.nitrogen_protein_yield, origin: @food.origin, protein_calorie_yield: @food.protein_calorie_yield, summary: @food.summary, waste_description: @food.waste_description, waste_yield: @food.waste_yield }
      end

      assert_redirected_to food_path(assigns(:food))
    end

    test "should show food" do
      get :show, id: @food
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @food
      assert_response :success
    end

    test "should update food" do
      patch :update, id: @food, food: { aliases: @food.aliases, carb_calorie_yield: @food.carb_calorie_yield, description: @food.description, fat_calorie_yield: @food.fat_calorie_yield, food_group_id: @food.food_group_id, is_complete: @food.is_complete, manufacturer: @food.manufacturer, nitrogen_protein_yield: @food.nitrogen_protein_yield, origin: @food.origin, protein_calorie_yield: @food.protein_calorie_yield, summary: @food.summary, waste_description: @food.waste_description, waste_yield: @food.waste_yield }
      assert_redirected_to food_path(assigns(:food))
    end

    test "should destroy food" do
      assert_difference('Food.count', -1) do
        delete :destroy, id: @food
      end

      assert_redirected_to foods_path
    end
  end
end