Rails.application.routes.draw do
  root 'main#index'
  get 'tests/index'
  get 'tests/show'
  get 'questions/index'
  get 'questions/new'
  get 'questions/edit'
  get 'questions/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tests do
    resources :questions, shallow: true
  end
end
