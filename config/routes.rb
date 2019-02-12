Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :articles do
    resources :comments
    collection do
      get :search #creates a new path for searching
    end
  end
  resources :subscribers
  root 'welcome#index'

end
