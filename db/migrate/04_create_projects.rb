class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :image
      t.string :title
      t.string :status
      t.string :primary_department
      t.string :primary_department_css_class
      t.string :start_date
      t.string :end_date
      t.string :actual_completion_date
      t.string :project_manager_first_name
      t.string :project_manager_last_name
      t.string :project_geography
      t.string :equity_considerations
      t.boolean :show_on_website_map
      t.string :client
      t.string :collaboration_departments
      t.string :description
      t.string :equity_categories
      t.string :equity_comment
      t.string :equity_impact
      t.string :external_partner
      t.string :funding
      t.string :location_city
      t.string :location_state
      t.string :location_zip
      t.string :mapc_project_num
      t.string :climate_change
      t.string :equity
      t.string :regional_collaboration
      t.string :smart_growth
      t.string :website
    end
  end
end
