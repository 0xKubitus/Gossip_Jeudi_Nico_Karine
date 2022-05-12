class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|

      #cas particulier - relation N - N avec un seul objet lié mais que l'on veut distinguer car le user qui envoie un message doit etre différent de celui qui le recoit :
      t.references :sender, index: true
      t.references :recipient, index: true

      t.text :content

      t.timestamps
    end
  end
end
