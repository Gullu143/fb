Rails.application.routes.draw do
  root 'homes#home'
  get '/friends', to: 'friends#friends'
  resources :posts do
  	member do
  		put 'like', to:'posts#like'
  	end
  end
  resources :comments
  post '/create', to:'friends#create'
  post "/add", to: "friends#add"
  post 'remove', to: 'friends#remove'
  post 'reject', to: 'friends#reject'
  get 'users/profile/:id', to: 'users#profile', as: 'profile'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
end
