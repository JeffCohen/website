Rails.application.routes.draw do

  get 'payments/new'

  root 'pages#index'

  get 'bikes' => 'bikes#index'
  get 'bikes/nearest/' => 'bikes#index'

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
  get 'blackhawks' => 'commands#blackhawks'

  get 'google' => 'payments#new', id: 'google'
  post 'google' => 'payments#create', id: 'google'

  # Teaching

  #get '/prereq' => 'teaching#hackthis'

  # ECommerce
  resources :payments do
    collection do
      post 'precheck'
      post 'paypal'
    end
  end

  resources :attendees
end
