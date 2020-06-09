Rails.application.routes.draw do
  devise_for :users
  resources :portfolios, except: [:show]
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
