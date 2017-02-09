class UsersController < ApplicationController
  def home
  end

  def admin
    if @current_user.try(:role) != "admin"
      flash[:info] = "Connectez-vous en admin pour accéder aux fonctionnalités avanceés"
      redirect_to "/users/home"
    end
  end

  def login
    # Sécurité si l'utilisateur accède au login via l'url
    if @current_user
      flash[:info] = "Déconnectez-vous pour vous identifier avec un autre utilisateur"
      redirect_to "/users/home"
    end
  end

  def signin
    # Sécurité si l'utilisateur accède au signin via l'url
    if @current_user
      flash[:info] = "Déconnectez-vous pour créer un nouveau compte"
      redirect_to "/users/home"
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

  def admin_delete_user
    if @current_user.try(:role) != "admin"
      return head :forbidden
    end

    @user = User.find(params[:user_id])
    if @user == @current_user
      flash[:info] = "User #{@user.name} a été supprimé"
      @user.destroy
      session[:user_id] = nil
      redirect_to "/users/home"
    else
      flash[:info] = "User #{@user.name} a été supprimé"
      @user.destroy
      redirect_to "/users/admin"
    end
  end
end
