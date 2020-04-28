Rails.application.routes.draw do
  resources :courses
  root "courses#home"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Base::API => '/'
end
