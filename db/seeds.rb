# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#On va utiliser la gem Faker
require 'faker'

#On vide les donées en base 
User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableGossipTag.destroy_all
PrivateMessage.destroy_all
JoinTablePmRecipient.destroy_all
Comment.destroy_all
Like.destroy_all


#Création de 10 villes
10.times do
	City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end
puts "10 villes ont été crées"

#Création de 10 users
10.times do
	u = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: "J'ai plein de Gossip à partager sur tout le monde, attention, le prochain est peut-être bien toi!", email: Faker::Internet.email, password: "azerty", age: Faker::Number.between(7, 77).to_i, city: City.order("RANDOM()").first)
end 
puts "10 utilisateurs ont été créés"

#Création de 20 gossips
20.times do
	Gossip.create(title: Faker::Hipster.word , content: Faker::ChuckNorris.fact , user: User.order("RANDOM()").first)
end
puts "20 gossips ont été créés"

# Création de 10 tags
10.times do
	Tag.create(title: Faker::Hipster.word)
end
puts "10 tags ont été créés"


# Association de tous les gossips à 2 tags
Gossip.all.each do |gossip|
	2.times do
		JoinTableGossipTag.create(gossip: gossip, tag: Tag.order("RANDOM()").first)
	end
end
puts "2 tags ont été affectés à chaque Gossip"

# On créé des messages envoyés par des users
10.times do
	u = User.order("RANDOM()").first
	PrivateMessage.create(content: "Message privé envoyé par #{u.first_name}", sender: u)
end 
puts "10 messages ont été envoyés par des utilisateurs"

#On rajoute 2 destinataire à chaque message envoyé
PrivateMessage.all.each do |pm|
	2.times do 
		u = User.order("RANDOM()").first
		JoinTablePmRecipient.create(private_message: pm, user: u)
	end
end
puts "2 destinataires ont été rajoutés à chaque message envoyé"


# Création de 10 commentaires par gossip
Gossip.all.each do |gossip|
	10.times do
		Comment.create(content: Faker::Simpsons.quote, gossip: gossip, user: User.order("RANDOM()").first)
	end
end
puts "10 commentaires ont été ajoutés à chaque potin"

#Création de 100 likes sur. des gossip et par des users aléatoire
100.times do
	Like.create(user: User.order("RANDOM()").first, gossip: Gossip.order("RANDOM()").first)
end
puts "100 likes ont été créés"

#Création d'un gossip "Anonymous"
User.create(first_name: "Ano", last_name: "Nymous", description: "Je reste anonyme parce que j'ai plein de Gossip à partager sur tout le monde, attention, le prochain est peut-être bien toi!", email: "anonymous@anonyme.fr",  password: "azerty", age: Faker::Number.between(7, 77).to_i, city: City.order("RANDOM()").first)

