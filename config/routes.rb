require 'sidekiq/web'

JenkinsNotifier::Application.routes.draw do
  resources :projects do
    resources :notifications, :only => [ :create ]
    resources :jobs, :only => [ :create ]
  end

  mount Sidekiq::Web => '/sidekiq'

  root :to => 'projects#index'
end
