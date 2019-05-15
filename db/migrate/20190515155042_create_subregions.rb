class CreateSubregions < ActiveRecord::Migration[5.2]
  def change
    create_table :subregions do |t|
      t.string :name
      t.string :abbv

      t.timestamps
    end
  end
end
