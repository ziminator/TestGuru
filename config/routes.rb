Rails.application.routes.draw do
  root 'main#index'
  #get 'questions/new'
  get '/index', to: 'main#index'
  get '/new', to: 'questions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tests do
    resources :questions, shallow: true
  end
end
