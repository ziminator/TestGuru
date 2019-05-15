Rails.application.routes.draw do
  #get 'questions/new'
  get 'main/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'

  resources :tests do
    resources :questions, shallow: true
  end
end
