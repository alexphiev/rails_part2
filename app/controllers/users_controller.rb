class UsersController < ApplicationController
  def home
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def create
    @name = params[:name]
    @password_digest = params[:password]

    if (@name != "") && (@password_digest != "")
      User.create name: @name,
      password_digest: BCrypt::Password.create(@password_digest)
      flash[:info] = "Création du compte: #{@name}"
      redirect_to "/users/home"
    else
      flash[:info] = "Remplissez tous les champs!"
      redirect_to "/users/signin"
    end
  end

  def check
    @current_user = User.find_by(name: params[:name])
    .try(:authenticate, params[:password]) # => user

    if @current_user
      session[:user_id] = @current_user.id
      flash[:info] = "Bienvenue #{@current_user.name}, vous êtes connecté !"
      redirect_to "/users/home"
    else
      session[:user_id] = nil
      flash[:info] = "Echec de la connexion"
      redirect_to "/users/login"
    end
  end

  def disconnect
    session[:user_id] = nil
    flash[:info] = "Vous êtes déconnecté !"
    redirect_to "/users/home"
  end
end
