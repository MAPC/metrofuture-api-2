class Project < ApplicationRecord
  has_many :municipality_projects
  has_many :municipalities, through: :municipality_projects
  has_many :subregions, through: :municipalities
 
  scope :newtons, -> {where(location_city: "Newton")}

  def url
    "#{Rails.application.routes.url_helpers.projects_url}/#{self.id}"
  end

  def links
    {
      :self => "/#{type}/#{object.to_param}",
      :next => object.next ? "/#{type}/#{object.next.to_param}" : nil,
      :prev => object.prev ? "/#{type}/#{object.prev.to_param}" : nil
    }
  end
end
