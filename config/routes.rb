Rails.application.routes.draw do

  root 'tests#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end
  end
end
