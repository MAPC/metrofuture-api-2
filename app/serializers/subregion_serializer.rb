class SubregionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :abbv, :geojson, :municipalities, :projects, :subregion_unique_projects, :project_count

  has_many :subregion_municipalities
  has_many :municipalities, through: :subregion_municipalities
  has_many :projects, through: :municipalities

  link :self, :url
end
