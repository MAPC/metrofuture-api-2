class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :image, :description, :location, :primary_department, :project_manager, :website, :status
  link :self, :url
end
