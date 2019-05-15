class MunicipalitiesController < ApplicationController
  before_action :set_municipality, only: [:show, :update, :destroy]

  # GET /municipalities
  def index
    render json: MunicipalitySerializer.new(Municipality.all)
  end

  # GET /municipalities/1
  def show
    render json: @municipality
  end

  # POST /municipalities
  def create
    @municipality = Municipality.new(municipality_params)

    if @municipality.save
      render json: @municipality, status: :created, location: @municipality
    else
      render json: @municipality.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /municipalities/1
  def update
    if @municipality.update(municipality_params)
      render json: @municipality
    else
      render json: @municipality.errors, status: :unprocessable_entity
    end
  end

  # DELETE /municipalities/1
  def destroy
    @municipality.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipality
      @municipality = Municipality.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def municipality_params
      params.require(:municipality).permit(:muni_id, :name)
    end
end
