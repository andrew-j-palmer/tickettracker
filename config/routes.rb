Rails.application.routes.draw do
  root 'tickets#index'
  get 'resolved/tickets', to: 'tickets#resolved'
  get 'admin',to: 'users#admin'
  resource :session
  resources :users

  resources :tickets do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
