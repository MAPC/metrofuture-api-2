class ProjectSerializer
  include FastJsonapi::ObjectSerializer
 
  attributes :image,
    :title,
    :municipalities,
    :subregions,
    :status,
    :primary_department,
    :primary_department_css_class,
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
    :location_city,
    :location_state,
    :location_zip,
    :mapc_project_num,
    :climate_change,
    :equity,
    :regional_collaboration,
    :smart_growth,
    :website

  has_many :municipalities, through: :municipality_projects
  has_many :subregions, through: :municipalities
  has_many :municipality_projects

  link :self, :url
 
end
