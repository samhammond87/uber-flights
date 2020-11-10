# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Flight.destroy_all
User.destroy_all

monica = User.create(name: 'Monica') 
rachel = User.create(name: 'Rachel') 
phoebe = User.create(name: 'Phoebe') 
ross = User.create(name: 'Ross')
joey = User.create(name: 'Joey') 
chandler = User.create(name: 'Chandler')

Flight.create(title: 'BadaBing')
Flight.create(title: 'Smelly Dog')
Flight.create(title: 'Champ')
Flight.create(title: 'Hammy')
Flight.create(title: 'Dino')
Flight.create(title: 'You-Ate-My-Sandwich')
Flight.create(title: 'Hairless Dog')
Flight.create(title: 'Pizza')
Flight.create(title: 'Phalange')