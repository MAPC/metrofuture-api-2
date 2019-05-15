class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :proj_id
      t.string :title
      t.binary :image
      t.text :description
      t.string :location
      t.string :primary_department
      t.string :project_manager
      t.string :website
      t.string :status
 
      t.timestamps
    end
  end
end
