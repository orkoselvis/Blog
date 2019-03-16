Rails.application.routes.draw do
  resources :categories
#  get 'sessions/new'

  resources :sessions
  resources :users
  get 'welcome/index'

  resources :articles do
    resources :comments
    collection do
      get :search #creates a new path for searching
    end
  end
  resources :subscribers
  root 'welcome#index'
  get 'pages/about' => 'application#show'
end
