Rails.application.routes.draw do

  root 'pages#index'

  get '/blog/:title' => 'pages#show'

  get 'ping' => 'pages#ping'

  get 'speaking' => 'pages#speaking'
  get 'team' => 'pages#team'
  get 'bio' => 'pages#about'
  get 'about' => 'pages#about'
  get 'consulting' => 'pages#consulting'
  get 'tutoring' => 'pages#tutoring'
  get 'training' => 'pages#training'
  get 'resume', to: redirect('/resume.pdf')

  get 'blackhawks' => 'commands#blackhawks'

end
