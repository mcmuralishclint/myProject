Rails.application.routes.draw do
  resources :verticals do
    resources :categories do
      resources :courses
    end
  end

  scope :api do
    scope :v1 do
      post '/create_resources', to: 'resources#create'
    end
  end
end
