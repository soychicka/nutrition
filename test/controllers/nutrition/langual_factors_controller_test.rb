require 'test_helper'

module Nutrition
  class LangualFactorsControllerTest < ActionController::TestCase
    setup do
      @langual_factor = nutrition_langual_factors(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:langual_factors)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create langual_factor" do
      assert_difference('LangualFactor.count') do
        post :create, langual_factor: { description: @langual_factor.description }
      end

      assert_redirected_to langual_factor_path(assigns(:langual_factor))
    end

    test "should show langual_factor" do
      get :show, id: @langual_factor
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @langual_factor
      assert_response :success
    end

    test "should update langual_factor" do
      patch :update, id: @langual_factor, langual_factor: { description: @langual_factor.description }
      assert_redirected_to langual_factor_path(assigns(:langual_factor))
    end

    test "should destroy langual_factor" do
      assert_difference('LangualFactor.count', -1) do
        delete :destroy, id: @langual_factor
      end

      assert_redirected_to langual_factors_path
    end
  end
end
