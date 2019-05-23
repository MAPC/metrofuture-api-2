class MunicipalityProject < ApplicationRecord
  belongs_to :municipality
  belongs_to :project
end
