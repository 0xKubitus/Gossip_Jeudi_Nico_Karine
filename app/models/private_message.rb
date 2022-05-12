class PrivateMessage < ApplicationRecord

  #cas particulier - relation N - N avec un seul objet lié mais que l'on veut distinguer car le user qui envoie un message doit etre différent de celui qui le recoit :
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

end
