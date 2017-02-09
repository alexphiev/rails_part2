class UsersController < ApplicationController
  def home
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
      flash[:info] = "Bienvenue #{@current_user.name} !"
      redirect_to "/users/home"
    else
      flash[:info] = "Echec de la connexion"
      redirect_to "/users/login"
    end
  end
end
