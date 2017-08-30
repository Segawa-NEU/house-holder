Rails.application.routes.draw do
  get '/welcome', to: "welcome#index", as: :welcome
  get '/' => redirect('/welcome')
  get '/signup', to: "users#new", as: :signup
  post '/signup', to: "users#create"
  get '/confirm/:token', to: "users#confirm", as: :confirm
  get '/login', to: "sessions#new", as: :login
  post '/login', to: "sessions#create"
  get '/home', to: "houses#show", as: :home
end
