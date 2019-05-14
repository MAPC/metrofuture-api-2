class MunicipalitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :muni_id, :name
  link :self, :url
end
