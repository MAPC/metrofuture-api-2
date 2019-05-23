class SubregionMunicipality < ApplicationRecord
  belongs_to :subregion
  belongs_to :municipality
end
