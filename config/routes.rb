Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api, defaults: { format: :json } do
    # Auth Users
    mount_devise_token_auth_for 'User', at: 'auth'
    # Auth Admins
    mount_devise_token_auth_for 'Admin', at: 'admin_auth'

    namespace :user do
      get 'dashboard', to: 'players#dashboard'

      resources :players, only: %i[index show] do
        post 'subscribe', to: 'players#subscribe'
        post 'unsubscribe', to: 'players#unsubscribe'
      end
    end

    namespace :admin do
      resources :users, only: %i[index show]
      resources :players, only: %i[index show] do
        post 'notification', to: 'players#create_notification'
      end

      put ':id/notification', to:'players#edit_notification', as: 'edit_notification'
      delete ':id/notification', to:'players#destroy_notification', as: 'delete_notification'
    end
    
  end
end
