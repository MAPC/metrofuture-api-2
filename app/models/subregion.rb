class Subregion < ApplicationRecord  
  has_many :subregion_municipalities
  has_many :municipalities, through: :subregion_municipalities
  has_many :projects, through: :municipalities

  def url
    "#{Rails.application.routes.url_helpers.subregions_url}/#{id}"
  end

  def subregion_unique_projects
    self.projects.uniq {|p| p.title}
  end

  def project_count
    self.subregion_unique_projects.count
  end
end
