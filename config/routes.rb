Rails.application.routes.draw do
  resources :verticals do
    resources :categories, only: [:index, :show] do
      resources :courses, only: [:index, :show]
    end
  end

  scope :api do
    scope :v1 do
      get '/search', to: 'search#index'
      get '/login', to: 'auth#login'
    end
  end
end
