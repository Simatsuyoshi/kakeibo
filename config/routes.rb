Rails.application.routes.draw do
  
  #get 'costs', to: 'costs#index'
  #get 'costs/show'
  #get 'costs/new'
  #get 'costs/create'
  #get 'costs/edit'
  #get 'costs/update'
  #get 'costs/destroy'
  #get 'toppages/index'
  get '/costs/month', to: 'costs#month'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:create]
  resources :costs
  resources :categories, only: [:show]
  
end
# get "messages/:id",to:"messages#show"
     # post "messages",to:"messages#create"
     # put "messages/:id",to:"messages#update"
     # delete "messages/:id",to:"messages#destory"
      
     # get "messages",to:"messages#index"
     # get "messages/new",to:"messages#new"
     # get "messages/:id/edit",to:"messages#edit"