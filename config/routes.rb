# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)

  get 'welcome', to: 'home#welcome'
  get 'contact-us', to: 'home#contact', as: 'contact_us'
  root 'home#welcome'
  resources :items, only: [:show, :index]
end
