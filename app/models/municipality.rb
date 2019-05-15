class Municipality < ApplicationRecord
  def url
    "#{Rails.application.routes.url_helpers.municipalities_url}/#{id}"
  end
end
