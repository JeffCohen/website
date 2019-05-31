Rails.application.routes.draw do

  root 'pages#index'

  get '/blog/:title' => 'pages#show'

  get '/workshops/:id' => 'workshops#show', as: :workshop

  get 'ping' => 'pages#ping'
  get 'bikes' => 'bikes#index'
  get 'bikes/nearest/' => 'bikes#index'

  # For Students
  get '/amazon.json' => 'amazon#index'
  get '/creditcard.json' => 'credit_card_validator#new'

  ###

  get 'essays' => 'essays#index'
  get 'speaking' => 'pages#speaking'
  get 'team' => 'pages#team'
  get 'bio' => 'pages#about'
  get 'about' => 'pages#about'
  get 'consulting' => 'pages#consulting'
  get 'tutoring' => 'pages#tutoring'
  get 'training' => 'pages#training'
  get 'resume', to: redirect('/resume.pdf')

  get 'spacex' => 'commands#spacex'
  get 'blackhawks' => 'commands#blackhawks'


  # Teaching

  #get '/prereq' => 'teaching#hackthis'

end
