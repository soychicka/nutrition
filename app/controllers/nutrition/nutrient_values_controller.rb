require_dependency "nutrition/application_controller"

module Nutrition
  class NutrientValuesController < ApplicationController
    before_action :set_nutrient_value, only: [:show, :edit, :update, :destroy]

    # GET /nutrient_values
    def index
      @nutrient_values = NutrientValue.all
    end

    # GET /nutrient_values/1
    def show
    end

    # GET /nutrient_values/new
    def new
      @nutrient_value = NutrientValue.new
    end

    # GET /nutrient_values/1/edit
    def edit
    end

    # POST /nutrient_values
    def create
      @nutrient_value = NutrientValue.new(nutrient_value_params)

      if @nutrient_value.save
        redirect_to @nutrient_value, notice: 'Nutrient value was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /nutrient_values/1
    def update
      if @nutrient_value.update(nutrient_value_params)
        redirect_to @nutrient_value, notice: 'Nutrient value was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /nutrient_values/1
    def destroy
      @nutrient_value.destroy
      redirect_to nutrient_values_url, notice: 'Nutrient value was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_nutrient_value
        @nutrient_value = NutrientValue.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def nutrient_value_params
        params.require(:nutrient_value).permit(:food_id, :nutrient_id, :yield, :is_fortified, :estimated_from, :last_update)
      end
  end
end
