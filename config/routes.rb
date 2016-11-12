Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :players, only: [:index, :show], defaults: {format: :json} do
        match 'show_products' => 'players#show_products', via: :get
      end
      resources :ads, only: [:index, :show, :create], defaults: {format: :json}
      resources :deals, only: [:index, :show, :create], defaults: {format: :json}
    end
  end
end
