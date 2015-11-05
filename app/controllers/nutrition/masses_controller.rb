require_dependency "nutrition/application_controller"

module Nutrition
  class MassesController < ApplicationController
    before_action :set_mass, only: [:show, :edit, :update, :destroy]

    # GET /masses
    def index
      @masses = Mass.all
    end

    # GET /masses/1
    def show
    end

    # GET /masses/new
    def new
      @mass = Mass.new
    end

    # GET /masses/1/edit
    def edit
    end

    # POST /masses
    def create
      @mass = Mass.new(mass_params)

      if @mass.save
        redirect_to @mass, notice: 'Mass was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /masses/1
    def update
      if @mass.update(mass_params)
        redirect_to @mass, notice: 'Mass was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /masses/1
    def destroy
      @mass.destroy
      redirect_to masses_url, notice: 'Mass was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_mass
        @mass = Mass.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def mass_params
        params.require(:mass).permit(:food_id, :seq, :quantity, :unit, :mass, :datapoints, :standard_deviation)
      end
  end
end
