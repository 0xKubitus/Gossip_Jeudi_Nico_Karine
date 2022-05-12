class Gossip < ApplicationRecord
  
  validates :title, 
    presence: true,
    length: { in: 3..14 }

  validates :content, presence: true

  belongs_to :user, optional: true #<- à mettre si l'on veut pouvoir autoriser la creation de gossip sans auteur ?)
  
  has_many :join_table_gossip_tags
  has_many :tags, through: :join_table_gossip_tags

  #has_many :comments, dependent: :destroy # <- permet de faire en sorte que si on supprime un Gossip, les commentaires associés seront aussi supprimés.

end
