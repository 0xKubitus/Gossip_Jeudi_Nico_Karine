Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  get '/profile', to: "sessions#profile", as: 'session_profile'

  resources :user, only: [:new, :create] 
 
  resources :gossip

  root to: 'gossip#index' # défini le 'root_path' sur la view index du gossip controller (on arrive sur cette page lorsqu'on tape 'localhost:3000')
  
  get '/gossip/:id', to: 'gossip#show', as: 'show_gossip' # défini 'localhost:3000/gossip/*id du gossip*' sur la view "gossip/show" gérée par la méthode show du GossipController - le 'as: 'gossip' permet de définir un préfix dans la route pour pouvoir faire un "link_to"
  
  
 
  #get '/new_with_form_tag', to: 'static#new_with_form_tag', as: 'gossip_form_tag' # uniquement pour essayer de faire un 'form tag' qui est la technique demandée par THP pour le formulaire que je n'avais pas utilisée dans mon 'gossip/new'
  # ou bien:
  resources :new_without_form_tag, only: [:new, :create] # là uniquement pour sauvegarder le formulaire que j'avais fait sans 'form_tag' (fais 'localhost:3000/new_without_form_tag' ta vas voir ! ;) )



  # à remplacer par "resources :static" ? (peut être pas possible car les noms de pages ne sont pas les standards 'new', 'index', 'show', ... ?)
  get '/contact', to: "static#contact"
  get '/team', to: "static#team"
  get '/welcome/:first_name', to: 'static#welcome'


  
  
  
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
