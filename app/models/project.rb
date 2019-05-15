class Project < ApplicationRecord
  def url
    "#{Rails.application.routes.url_helpers.projects_url}/#{self.id}"
  end
end
