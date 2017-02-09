# config/routes.rb
Rails.application.routes.draw do
  get 'users/home' => 'users#home'
  post 'users/home' => 'users#disconnect'

  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'

  get 'users/signin' => 'users#signin'
  post 'users/signin' => 'users#create'

  get 'users/admin' => 'users#admin'
  post 'users/admin' => 'users#admin_delete_user'
end
