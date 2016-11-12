Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'deals/index'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'deals/show'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'deals/create'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :players, only: [:index, :show], defaults: {format: :json}
      resources :ads, only: [:index, :show, :create], defaults: {format: :json}
      resources :deals, only: [:index, :show, :create], defaults: {format: :json}
    end
  end
end
