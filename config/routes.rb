Rails.application.routes.draw do
  
  resources :card_readings
  resources :readings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :cards
      resources :users

      get 'spreads/random_card' => "spreads#random_card"
      get 'spreads/shuffled' => "spreads#shuffle"
      get 'spreads/three_cards' => "spreads#three_cards"
      get 'spreads/celtic_cross' => "spreads#celtic_cross"
    end
  end
end
