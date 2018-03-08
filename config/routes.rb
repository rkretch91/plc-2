Rails.application.routes.draw do
  get 'events/index'

  get 'events/show'

  get 'events/new'

  get 'events/create'

  get 'events/edit'

  get 'events/update'

  get 'events/destroy'

  devise_for :users,
    controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  root to: 'pages#home'

  resources :events do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
