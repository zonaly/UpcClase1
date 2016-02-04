Rails.application.routes.draw do
  
  resources :profiles, only: [:edit, :update]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'pages/index'

  get 'pages/about_us'

  get 'pages/faq'

  get 'pages/tos'

  get 'pages/contact_us'

  root 'pages#index'

end
