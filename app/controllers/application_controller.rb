class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  private #toutes les fonctions suivantes ne peuvent pas être associées à des routes

  # Fonciton pour garder la session active dans tous les controlleurs
  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end
