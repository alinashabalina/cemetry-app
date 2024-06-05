Rails.application.routes.draw do
  root to: "cities#index"
  get "/index", to: "cities#index"
  get "/info", to: "graveyards#info"
  get "/info-g/:id", to: "guides#info"
  get "/guides", to: "guides#index", as: "all_guides"
  get "/guides/apply", to: "guides#apply", as: "apply"
  post "/guides/create", to: "guides#create", as: "guides"
  get "/guides/:guide_id/edit", to: "guides#edit", as: "guide_edit"
  get "/create/tour", to: "tours#suggest", as: "suggest"
  get "/resources", to: "pages#resources", as: "resources"
  get "/subscriptions", to: "tours#all_subscriptions", as: "subscriptions"
  post "/book/:id", to: "tours#book", as: "booking"
  devise_for :users

  mount ActionCable.server => "/cable"

resources :guides, only: [:show]

  resources :cities, only: [:index, :show] do
    resources :graveyards, only: [:show]
    resources :guides, only: [:create]
  end

  resources :guides, only: [:show] do
    resources :subscriptions, only: [:create]
  end

  resources :users, only: [:show]
  resources :tours

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  if Rails.env.development?
    get '404', to: 'exceptions#show'
    get '422', to: 'exceptions#show'
    get '500', to: 'exceptions#show'
 end
end
