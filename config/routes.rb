Rails.application.routes.draw do
  root 'tickets#index'
  get 'resolved/tickets', to: 'tickets#resolved'
  get 'admin',to: 'users#admin'
  get 'comments/:id/edit', to: 'comments#edit'
  post 'tickets/:id/comments/:id/edit', to: 'comments#update'
  delete 'comments/:id/destroy', to: 'comments#destroy'
  resource :session
  resources :users

  resources :tickets do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
