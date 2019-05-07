class CreateMunicipalities < ActiveRecord::Migration[5.2]
  def change
    create_table :municipalities do |t|
      t.integer :muni_id
      t.string :name

      t.timestamps
    end
  end
end
