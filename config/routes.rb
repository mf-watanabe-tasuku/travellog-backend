Rails.application.routes.draw do
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :eyecatches, only: [:create, :update]
      resources :posts do
        collection do
          get :count
        end
      end
    end
  end
end
