Rails.application.routes.draw do
  # get 'topics/index'
  # get 'topics/show'
  resources :topics, only: [:index, :show]
  # resources :comments
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'} 
  
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  
  get 'portfolio/:id', to: "portfolios#show", as: "portfolio_show"
  get 'angular_portfolios', to: "portfolios#angular_portfolio"

  root 'pages#home'
  get 'about', to: "pages#about"
  get 'contact', to: "pages#contact"

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
