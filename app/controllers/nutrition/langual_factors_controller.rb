require_dependency "nutrition/application_controller"

module Nutrition
  class LangualFactorsController < ApplicationController
    before_action :set_langual_factor, only: [:show, :edit, :update, :destroy]

    # GET /langual_factors
    def index
      @langual_factors = LangualFactor.all
    end

    # GET /langual_factors/1
    def show
    end

    # GET /langual_factors/new
    def new
      @langual_factor = LangualFactor.new
    end

    # GET /langual_factors/1/edit
    def edit
    end

    # POST /langual_factors
    def create
      @langual_factor = LangualFactor.new(langual_factor_params)

      if @langual_factor.save
        redirect_to @langual_factor, notice: 'Langual factor was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /langual_factors/1
    def update
      if @langual_factor.update(langual_factor_params)
        redirect_to @langual_factor, notice: 'Langual factor was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /langual_factors/1
    def destroy
      @langual_factor.destroy
      redirect_to langual_factors_url, notice: 'Langual factor was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_langual_factor
        @langual_factor = LangualFactor.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def langual_factor_params
        params.require(:langual_factor).permit(:description)
      end
  end
end
