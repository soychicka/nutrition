require 'test_helper'

module Nutrition
  class NutrientsControllerTest < ActionController::TestCase
    setup do
      @nutrient = nutrition_nutrients(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:nutrients)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create nutrient" do
      assert_difference('Nutrient.count') do
        post :create, nutrient: { label: @nutrient.label, name: @nutrient.name, position: @nutrient.position, significant_figures: @nutrient.significant_figures, unit: @nutrient.unit }
      end

      assert_redirected_to nutrient_path(assigns(:nutrient))
    end

    test "should show nutrient" do
      get :show, id: @nutrient
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @nutrient
      assert_response :success
    end

    test "should update nutrient" do
      patch :update, id: @nutrient, nutrient: { label: @nutrient.label, name: @nutrient.name, position: @nutrient.position, significant_figures: @nutrient.significant_figures, unit: @nutrient.unit }
      assert_redirected_to nutrient_path(assigns(:nutrient))
    end

    test "should destroy nutrient" do
      assert_difference('Nutrient.count', -1) do
        delete :destroy, id: @nutrient
      end

      assert_redirected_to nutrients_path
    end
  end
end
