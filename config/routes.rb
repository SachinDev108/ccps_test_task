Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :customers, only: [:index]
      resources :sales, only: [:create, :index]
    end
  end    
end
