class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.all.select {|p| !p.location_city.nil? }
    render json: ProjectSerializer.new(@projects)
  end

  # GET /projects/1
  def show
    render json: ProjectSerializer.new(@project)
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(
        :title,
        :status,
        :primary_department,
        :start_date,
        :end_date,
        :actual_completion_date,
        :project_manager_first_name,
        :project_manager_last_name,
        :project_geography,
        :equity_considerations,
        :show_on_website_map,
        :client,
        :collaboration_departments,
        :description,
        :equity_categories,
        :equity_comment,
        :equity_impact,
        :external_partner,
        :funding,
        :latitude,
        :longitude,
        :location_street_address,
        :location_city,
        :location_state,
        :location_zip,
        :mapc_project_num,
        :climate_change,
        :equity,
        :regional_collaboration,
        :smart_growth,
        :website
      )
    end
end
