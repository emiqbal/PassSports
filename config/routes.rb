Rails.application.routes.draw do
  resources :equipments, only: [:index, :show, :create, :new] do
    resources :rentals, only: [:new, :create] # nested in controller?
  end
  resources :rentals, only: [:index]
  devise_for :users
  root to: 'equipments#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# root to admin?
# devise_for :users?
