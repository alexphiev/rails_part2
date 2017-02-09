# config/routes.rb
Rails.application.routes.draw do
  get 'users/home' => 'users#home'
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'
end
