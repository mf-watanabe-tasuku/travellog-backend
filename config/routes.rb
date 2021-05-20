Rails.application.routes.draw do
  get 'sessions/new'
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :eyecatches, only: [:create, :destroy]
      resources :posts do
        collection do
          get :count
        end
      end
      resources :users
      namespace :auth do
        post '/login', to: 'sessions#create'
        delete '/logout', to: 'sessions#destroy'
      end
    end
  end
end
