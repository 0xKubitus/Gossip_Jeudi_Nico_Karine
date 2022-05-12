class SessionsController < ApplicationController

  def new
    @email = params[:email] #à confirmer car il me semble avoir vu quelqu'un faire sans
    @password = params[:password] #à confirmer car il me semble avoir vu quelqu'un faire sans
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email]) 

    puts params[:password]
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        # redirige où tu veux, avec un flash ou pas:
        redirect_to session_profile_path # on vient de se connecter donc autant rester sur la page d'accueil = 'root_path' (mais on pourrait renvoyer sur "sessions_profile" ou "welcome/user" ...)
        puts " "
        puts "    GG vieux BG ! Une nouvelle session est lancée !"
        puts " "
        flash[:success] = "Tu es connecté(e) !" # je ne sais pas pk ça ne fait pas pop d'alerte :'(
      else
        flash.now[:danger] = 'Invalid email/password combination' # ne marche pas non plus ...
        render 'new'
      end
  end

  def destroy
    session.delete(:user_id)
    render 'new'
  end


  def profile
  end



end # fin de la classe SessionsController
