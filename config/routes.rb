Rails.application.routes.draw do
  devise_for :users,
    controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  root to: 'pages#home'

  get 'pages/about'
  # get '/about', :to => redirect('/about.html')
  # get 'pages/about', :to => 'about_page'

  resources :events do
    member do
      put 'booking'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
