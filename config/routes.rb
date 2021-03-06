Rails.application.routes.draw do

  devise_for :users
  devise_for :managers
  root "courses#home"
  scope :management do
    resources :courses
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Base::API => '/'
end
