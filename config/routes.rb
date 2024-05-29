Rails.application.routes.draw do
  devise_for :users

  resources :accomodations, only: [:index, :new, :show, :create] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :destroy] do
    member do
      patch :accept
      patch :decline
    end
  end

  root to: "pages#home"
end

