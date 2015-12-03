Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile'},
             controllers: {
                 omniauth_callbacks: 'omniauth_callbacks',
                 registrations: 'registrations'
             }

  resources :users, only: :show
  resources :rooms
  resources :photos

  resources :rooms do
    resources :reservations, only: [:create]
  end
end
