require_dependency "nutrition/application_controller"

module Nutrition
  class FoodGroupsController < ApplicationController
    before_action :set_food_group, only: [:show, :edit, :update, :destroy]

    # GET /food_groups
    def index
      @food_groups = FoodGroup.all
    end

    # GET /food_groups/1
    def show
    end

    # GET /food_groups/new
    def new
      @food_group = FoodGroup.new
    end

    # GET /food_groups/1/edit
    def edit
    end

    # POST /food_groups
    def create
      @food_group = FoodGroup.new(food_group_params)

      if @food_group.save
        redirect_to @food_group, notice: 'Food group was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /food_groups/1
    def update
      if @food_group.update(food_group_params)
        redirect_to @food_group, notice: 'Food group was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /food_groups/1
    def destroy
      @food_group.destroy
      redirect_to food_groups_url, notice: 'Food group was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_food_group
        @food_group = FoodGroup.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def food_group_params
        params.require(:food_group).permit(:name)
      end
  end
end
