require 'factory_bot'

FactoryBot.define do
  factory :project do
    proj_id { 1 }
    title { "My Project Title"}
    image { "binary image data"}
    description { "My Project Description"}
    location  { "My Project Location" }
    primary_department { "Department_primary"}
    project_manager { "Project manager "}
    website { "http://www.myproject.com "}
    status { "Captain, we are out of dilithium crystals"}
  end
end
