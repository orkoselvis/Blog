Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles do
    resources :comments
    collection do
      get :search #creates a new path for searching
    end
  end

  root 'welcome#index'

end
