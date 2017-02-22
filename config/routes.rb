Rails.application.routes.draw do

  get 'payments/new'

  root 'pages#index'

  # For Students
  get '/amazon.json' => 'amazon#index'
  get '/creditcard.json' => 'credit_card_validator#new'

  ###

  get 'essays' => 'essays#index'
  get 'speaking' => 'pages#speaking'
  get 'bio' => 'pages#about'
  get 'about' => 'pages#about'
  get 'consulting' => 'pages#consulting'
  get 'tutoring' => 'pages#tutoring'
  get 'training' => 'pages#training'
  get 'resume', to: redirect('/resume.pdf')

  get 'spacex' => 'commands#spacex'
  post 'spacex' => 'commands#spacex'

  get 'google' => 'payments#new', id: 'google'
  post 'google' => 'payments#create', id: 'google'

  # Teaching

  get '/prereq' => 'teaching#hackthis'

  # ECommerce
  resources :payments do
    collection do
      post 'precheck'
      post 'paypal'
    end
  end

  resources :attendees
end
