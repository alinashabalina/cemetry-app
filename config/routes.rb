Rails.application.routes.draw do
  root to: "cities#index"
  get "/index", to: "cities#index"
  get "/info", to: "graveyards#info"
  get "/info-g/:id", to: "guides#info"
  post "/guides/:guide_id/subscribe", to: "subscriptions#create"
  devise_for :users
  resources :cities, only: [:index, :show] do
    resources :graveyards, only: [:show]
    resources :guides, only: [:create]
  end

  resources :guides, only: [:index, :show]

  resources :users, only: [:show, :edit]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  if Rails.env.development?
    get '404', to: 'exceptions#show'
    get '422', to: 'exceptions#show'
    get '500', to: 'exceptions#show'
 end
end
