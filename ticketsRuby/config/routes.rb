Rails.application.routes.draw do
  devise_for :users
  # get 'events/index'
  # get 'events/new'
  # post 'events/new' => 'events#create'
  # get 'events/create'
  # get 'events/:id' => 'events#show'
  # get 'events/:id' => 'events#show'

  root :to => "events#index"

  resources :tickets
  resources :events, :only => [:index, :new, :create, :show]

  # resources :events
  # resources :tickets
  # root :to => "tickets#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
