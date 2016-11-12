Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :players, only: [:index, :show], defaults: {format: :json}
      resources :ads, only: [:index, :show, :create], defaults: {format: :json}
    end
  end
end
