class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      
      'password' => params[:password],

      'email' => params[:email],
      'city_id' => City.all.sample.id # (pour l'instant on prend un id au hasard parmis nos Cities)
    )

    if @user.save # on tente de voir si la création a bien fonctionné :
      puts " "
      puts "    GG vieux BG ! Un nouveau User a été enregistré dans la BDD !"
      puts " "
      redirect_to root_path # si c'est le cas, l'utilisateur doit être redirigé vers la page 'root' (ou "/")



      #ajouter une méthode qui 'Login' automatiquement un nouveau user lorsqu'il 'Sign in' :
      # aucune idée comment on fait ça ! 


      
    else
      puts " "
      puts " Et non t'es une brèle, essaye encore !!!"
      puts " "
      render 'new'
    end
    
  end






end # fin de la classe USerController
