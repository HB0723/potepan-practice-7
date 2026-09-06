Rails.application.routes.draw do
  post "reservations/confirm", to: "reservations#confirm", as: :reservations_confirm
  post "reservations", to: "reservations#create", as: :reservations

  get "reservations", to: "reservations#index", as: :reservations_index
  get "reservations/new", to: "reservations#new", as: :new_reservation
  get "reservations/complete", to: "reservations#complete", as: :reservation_complete
  get "reservations/:id", to: "reservations#show", as: :reservation

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  namespace :users do
    get "account", to: "account#show", as: :account

    get "profiles/edit", to: "profiles#edit"
    patch "profiles", to: "profiles#update"
  end

  get "rooms/search", to: "rooms#search", as: :search_rooms

  resources :rooms

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
