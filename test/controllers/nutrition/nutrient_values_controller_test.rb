require 'test_helper'

module Nutrition
  class NutrientValuesControllerTest < ActionController::TestCase
    setup do
      @nutrient_value = nutrition_nutrient_values(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:nutrient_values)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create nutrient_value" do
      assert_difference('NutrientValue.count') do
        post :create, nutrient_value: { estimated_from: @nutrient_value.estimated_from, food_id: @nutrient_value.food_id, is_fortified: @nutrient_value.is_fortified, last_update: @nutrient_value.last_update, nutrient_id: @nutrient_value.nutrient_id, yield: @nutrient_value.yield }
      end

      assert_redirected_to nutrient_value_path(assigns(:nutrient_value))
    end

    test "should show nutrient_value" do
      get :show, id: @nutrient_value
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @nutrient_value
      assert_response :success
    end

    test "should update nutrient_value" do
      patch :update, id: @nutrient_value, nutrient_value: { estimated_from: @nutrient_value.estimated_from, food_id: @nutrient_value.food_id, is_fortified: @nutrient_value.is_fortified, last_update: @nutrient_value.last_update, nutrient_id: @nutrient_value.nutrient_id, yield: @nutrient_value.yield }
      assert_redirected_to nutrient_value_path(assigns(:nutrient_value))
    end

    test "should destroy nutrient_value" do
      assert_difference('NutrientValue.count', -1) do
        delete :destroy, id: @nutrient_value
      end

      assert_redirected_to nutrient_values_path
    end
  end
end
