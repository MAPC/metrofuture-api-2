class Municipality < ApplicationRecord
  has_many :municipality_projects
  has_many :projects, through: :municipality_projects
  has_many :subregion_municipalities
  has_many :subregions, through: :subregion_municipalities

  def url
    "#{Rails.application.routes.url_helpers.municipalities_url}/#{id}"
  end
end
