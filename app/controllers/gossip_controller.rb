class GossipController < ApplicationController
  
  def index
    @gossips = Gossip.all # permet de pouvoir utiliser '@gossips' dans la view "gossip#index" et donc d'y lister tous les gossips.
  end

  def show
    @gossip = Gossip.find(params[:id]) # permet de choisir le gossip à afficher selon l'id du param et d'afficher la page de ce gossip en particulier
  end

  def new
    @gossip = Gossip.new
  end

  def create # ici 'params' sert à récupérer les inputs de l'utilisateur dans le formulaire de la page 'gossip/new' et créé une entre en BDD avec ces données.
    @gossip = Gossip.new( 
      'title' => params[:title],
      'content' => params[:content],
      'user_id' => User.all.sample.id # à remplacer par 'current_user.id'(pour l'instant on prend un id au hasard parmis nos Users, mais il faudra changer cela ! )
    )
  
    if @gossip.save # on tente de voir si la création a bien fonctionné :
      puts " "
      puts "    GG ! Ta rumeur enregistrée dans la BDD, champion !!!"
      puts " "
      redirect_to root_path # si c'est le cas, l'utilisateur doit être redirigé vers la page 'root' (ou "/")
    else
      puts " "
      puts " Et non t'es une brèle, essaye encore !!!"
      puts " "
      render 'new'
    end

  end




end # fin de la class GossipController
