class CreateMunicipalityProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :municipality_projects do |t|
      t.integer :municipality_id
      t.integer :project_id
    end
  end
end
