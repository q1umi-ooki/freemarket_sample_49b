Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',registrations: 'users/registrations'}
  root 'products#index'
  resources :profiles, only: [:new,:create,:show,:edit] do
    member do
      get 'pay_method'
    end
    collection do
      get 'log_out_page'
    end
  end
  resources :products, only:[:index,:new,:create,:show,:edit,:update,:destroy] do
    member do
      get 'confirm_buy'
      get 'edit_index'
    end
    collection do
      get 'search'
    end
  end
  # resources :users
  # resources :comments
  # resources :brands
  resources :category_parents, only:[:index,:show]
  resources :categories, only:[:index,:show, :new]
  resources :category_children, only: [:index, :show, :new]
  resources :users,  only:[:new] do
    resources :products do
      post 'buy'
    end
  end
  resources :cards, only:[:new,:create,:destroy]

end
