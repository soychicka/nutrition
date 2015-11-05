require_dependency "nutrition/application_controller"

module Nutrition
  class NutrientsController < ApplicationController
    before_action :set_nutrient, only: [:show, :edit, :update, :destroy]

    # GET /nutrients
    def index
      @nutrients = Nutrient.all
    end

    # GET /nutrients/1
    def show
    end

    # GET /nutrients/new
    def new
      @nutrient = Nutrient.new
    end

    # GET /nutrients/1/edit
    def edit
    end

    # POST /nutrients
    def create
      @nutrient = Nutrient.new(nutrient_params)

      if @nutrient.save
        redirect_to @nutrient, notice: 'Nutrient was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /nutrients/1
    def update
      if @nutrient.update(nutrient_params)
        redirect_to @nutrient, notice: 'Nutrient was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /nutrients/1
    def destroy
      @nutrient.destroy
      redirect_to nutrients_url, notice: 'Nutrient was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_nutrient
        @nutrient = Nutrient.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def nutrient_params
        params.require(:nutrient).permit(:unit, :label, :name, :significant_figures, :position)
      end
  end
end
