Rails.application.routes.draw do

  root 'posts#index', as: 'home'

  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  #get 'start' => 'index'
  #get 'post' => 'posts#index' не уходит на post/show

  resources :posts
  #resource :pages

  get 'autocompletes/posts' => 'autocompletes#posts'

end
