Rails.application.routes.draw do
  resources :verticals do
    resources :categories do
      resources :courses
    end
  end

  post 'management/create_or_update_resources', to: 'management#create_or_update_resources'
end
