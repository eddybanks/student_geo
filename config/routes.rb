Rails.application.routes.draw do
  resources :maps
  resources :high_schools
  root              'home#index'

  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
