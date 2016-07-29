Rails.application.routes.draw do

  get 'payments/new'

  root 'pages#index'

  get 'essays' => 'essays#index'
  get 'speaking' => 'pages#speaking'
  get 'consulting' => 'pages#consulting'
  get 'tutoring' => 'pages#tutoring'
  get 'training' => 'pages#training'

  get 'spacex' => 'commands#spacex'
  get 'google' => 'payments#new', id: 'google'
  post 'google' => 'payments#create', id: 'google'

  resources :payments do
    collection do
      post 'precheck'
      post 'paypal'
    end
  end

  resources :attendees
end
