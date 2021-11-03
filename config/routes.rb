Rails.application.routes.draw do
  
  resources :posts

  resources :likes do
    member do
      get :delete
    end
  end

  resources :logins
  #root to: 'dashboards#show'
  #will automatically redirect users to the sign in page upon entering the website
  root to: 'announcements#index'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end  
  # temporarily set the announcements page as home, for convenience
  # the google oauth tutorial had me set a different root idk how were going to do this

  resources :meetings do
    resources :joins
  end

  resources :events

  resources :joins

  get 'member/ManageMembers'

  resources :announcements do
    member do
      get :delete
    end
  end

  resources :members

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
