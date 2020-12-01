Rails.application.routes.draw do
  resources :equipments, only: [:index, :show, :create]
  devise_for :users
  root to: 'equipments#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# root to admin?
# devise_for :users?
