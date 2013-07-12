JenkinsNotifier::Application.routes.draw do
  resources :projects do
    resources :notifications, :only => [ :create ]
  end

  root :to => 'projects#index'
end