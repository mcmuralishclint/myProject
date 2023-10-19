Rails.application.routes.draw do
  resources :verticals, only: [:index, :show] do
    resources :categories, only: [:index, :show] do
      resources :courses, only: [:index, :show]
    end
  end

  scope :api do
    scope :v1 do
      post '/create_resources', to: 'resources#create'
    end
  end
end
