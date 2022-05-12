class User < ApplicationRecord
 
  #les validations doivent tjrs être au début de la classe du modele
  validates :first_name,
    presence: true,
    length: { in: 2..30}

  validates :last_name, presence: true

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Donne-moi une adresse email valide stp" }

  belongs_to :city, optional: :true

  has_many :gossips

  #cas particulier - relation N - N avec un seul objet lié mais que l'on veut distinguer car le user qui envoie un message doit etre différent de celui qui le recoit :
  has_many :received_PMs, foreign_key: "recipient_id", class_name: "PrivateMessage"
  has_many :sent_PMs, foreign_key: "sender_id", class_name: "PrivateMessage"
  

  has_secure_password # permet l'utilisation de la gem 'bcrypt' pour la gestion du password
  validates :password, 
    presence: true,
    length: { minimum: 6 }


  #has_many :comments # (on ajoutera ce modèle/objet plus tard)


end # fin de la classe User

