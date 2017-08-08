Rails.application.routes.draw do
  resources :reports
  namespace :api, { format: 'json' } do
    resources :articles
    namespace :v1 do
      resources :webhooks
      root to: 'webhooks#index'
    end
    root to: 'articles#index'
  end

  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'articles#index'
end
