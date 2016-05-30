Rails.application.routes.draw do

  root 'pages#index'

  get 'essays' => 'essays#index'
  get 'speaking' => 'pages#speaking'
  get 'consulting' => 'pages#consulting'
  get 'tutoring' => 'pages#tutoring'

  get 'spacex' => 'commands#spacex'

end
