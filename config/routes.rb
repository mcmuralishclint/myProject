Rails.application.routes.draw do
  resources :verticals do
    resources :categories, only: [:index, :show] do
      resources :courses, only: [:index, :show]
    end
  end

  scope :api do
    scope :v1 do
      post '/create_resources', to: 'resources#create'
      patch '/update_resources/:id', to: 'resources#update'
      get '/search', to: 'search#index'
    end
  end
end
