class SubregionsController < ApplicationController
  before_action :set_subregion, only: [:show, :update, :destroy]

  # GET /subregions
  def index
    render json: SubregionSerializer.new(Subregion.all)
  end

  # GET /subregions/1
  def show
    render json: @subregion
  end

  # POST /subregions
  def create
    @subregion = Subregion.new(subregion_params)

    if @subregion.save
      render json: @subregion, status: :created, location: @subregion
    else
      render json: @subregion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subregions/1
  def update
    if @subregion.update(subregion_params)
      render json: @subregion
    else
      render json: @subregion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subregions/1
  def destroy
    @subregion.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subregion
      @subregion = Subregion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subregion_params
      params.require(:subregion).permit(:name, :abbv)
    end
end
