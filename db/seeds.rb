# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all

# Creer 10 random Cities, Users et Tags:
10.times { |x| city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code) }
 
10.times { |x| user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quotes::Shakespeare.hamlet_quote, email: Faker::Internet.email, age: rand(18..99), city_id: City.all.sample) }

10.times { |x| tag = Tag.create(title: Faker::Lorem.words) }

# Créer 20 Gossips random, liés chacun à un user :
20.times do |x| 
  gossip = Gossip.new(title: Faker::Lorem.characters(number: 3..14),content: Faker::Movie.quote)
  gossip.user_id = User.all.sample.id
  gossip.save
end

# Mettre un tag sur chaque gossip:
40.times do |x|
  join = JoinTableGossipTag.new(
    gossip_id: Gossip.all.sample.id,
    tag_id: Tag.all.sample.id)
  join.save
end

# Créer 10 MPs random, liés chacun à deux users -> un 'sender' et un 'recipient' :
10.times do |x|
  message = PrivateMessage.new(sender: User.all.sample, recipient: User.all.sample, content: Faker::Lorem.words(number: 5)) 
  message.sender_id = User.all.sample.id
  message.recipient_id = User.all.sample.id
  message.save
end



=begin

Gossip.all.each do |comments|
  5.times do
    comment = Comment.create(
      content: Faker::Quotes::Shakespeare.hamlet_quote,
      author_id: User.find(rand(User.first.id..User.last.id)).id,
      gossip_id: comments.id
    )
  end
end

=end