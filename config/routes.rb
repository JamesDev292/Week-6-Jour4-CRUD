Rails.application.routes.draw do
  # root plus page static:
  root "static_pages#home"
  get "/team", to: "static_pages#team"
  get "/contact", to: "static_pages#contact"
  get "/home", to: "static_pages#home"
  get "/welcome/:id", to: "dynamic_pages#welcome"


  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :gossips
  resources :users
  resources :cities
  resources :sessions
  # Defines the root path route ("/")
  # root "posts#index"
end
# ActionController::MissingExactTemplate (GossipsController#show is missing a template for request formats: text/html):
