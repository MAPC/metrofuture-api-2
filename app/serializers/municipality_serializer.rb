class MunicipalitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :geojson, :muni_id, :image, :subregions, :projects
  
  has_many :municipality_projects
  has_many :projects, through: :municipality_projects
  has_many :subregion_municipalities
  has_many :subregions, through: :subregion_municipalities
  
  link :self, :url
 end
