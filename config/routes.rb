Rails.application.routes.draw do
  resources :municipalities
  resources :projects
  resources :subregions
  root to: 'municipalities#root'
  get '/subregions/:id/subregion_unique_projects', to: 'subregions#subregion_unique_projects'
end
