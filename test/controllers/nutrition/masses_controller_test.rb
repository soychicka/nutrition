require 'test_helper'

module Nutrition
  class MassesControllerTest < ActionController::TestCase
    setup do
      @mass = nutrition_masses(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:masses)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create mass" do
      assert_difference('Mass.count') do
        post :create, mass: { datapoints: @mass.datapoints, food_id: @mass.food_id, mass: @mass.mass, quantity: @mass.quantity, seq: @mass.seq, standard_deviation: @mass.standard_deviation, unit: @mass.unit }
      end

      assert_redirected_to mass_path(assigns(:mass))
    end

    test "should show mass" do
      get :show, id: @mass
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @mass
      assert_response :success
    end

    test "should update mass" do
      patch :update, id: @mass, mass: { datapoints: @mass.datapoints, food_id: @mass.food_id, mass: @mass.mass, quantity: @mass.quantity, seq: @mass.seq, standard_deviation: @mass.standard_deviation, unit: @mass.unit }
      assert_redirected_to mass_path(assigns(:mass))
    end

    test "should destroy mass" do
      assert_difference('Mass.count', -1) do
        delete :destroy, id: @mass
      end

      assert_redirected_to masses_path
    end
  end
end
