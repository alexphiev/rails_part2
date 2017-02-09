# config/routes.rb
Rails.application.routes.draw do
  get 'users/home' => 'users#home'
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'

  get 'users/signin' => 'users#signin'
  post 'users/signin' => 'users#create'
end
