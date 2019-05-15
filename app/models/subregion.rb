class Subregion < ApplicationRecord
  def url
    "#{Rails.application.routes.url_helpers.subregions_url}/#{id}"
  end
end
