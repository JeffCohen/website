Rails.application.routes.draw do

  get 'payments/new'

  root 'pages#index'

  get 'essays' => 'essays#index'
  get 'speaking' => 'pages#speaking'
  get 'consulting' => 'pages#consulting'
  get 'tutoring' => 'pages#tutoring'

  get 'spacex' => 'commands#spacex'
  get 'google' => 'payments#new', id: 'google'

  resources :payments 

end
