class SubregionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :abbv
  link :self, :url
end
