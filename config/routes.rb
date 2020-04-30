Rails.application.routes.draw do

  devise_for :managers
  root "courses#home"
  scope :management do
    resources :courses
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Base::API => '/'
end
