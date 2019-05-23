class CreateSubregionMunicipalities < ActiveRecord::Migration[5.2]
  def change
    create_table :subregion_municipalities do |t|
      t.integer :subregion_id
      t.integer :municipality_id
    end
  end
end
