Rails.application.routes.draw do

  root 'pages#index'

  get 'essays' => 'essays#index'

end
