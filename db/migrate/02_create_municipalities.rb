class CreateMunicipalities < ActiveRecord::Migration[5.2]
  def change
    create_table :municipalities do |t|
      t.string :name
      t.integer :muni_id
      t.json :geojson
      t.string :image
      t.timestamps
    end
  end
end
