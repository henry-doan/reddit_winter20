Rails.application.routes.draw do
  root 'subs#index'
  # http verb url path, to: 'controller#action'
  # get '/subs', to: 'subs#index' 
  # post '/subs', to: 'subs#create'

  resources :subs do
    resources :topics
  end

  resources :topics do
    resources :comments
  end
          #  place holder for the number pk id 1
  # /subs/:sub_id/
  # /subs/1/
  # /subs/3/

  # :id  
  # params[:id]

  # /subs/1/topics/3
  # params[:sub_id] = 1 
  # params[:id] = 3

end
