Rails.application.routes.draw do
  devise_for :users

  resources :accomodations, only: [:index, :new, :show, :create ] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: :index

  root to: "accomodations#index"
end
