# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Monster.delete_all
Element.delete_all
Move.delete_all

fire = Element.create!(name: 'fire', strong_to: 'ice', weak_to: 'water', neutral: '', immune: 'fire')
ice = Element.create!(name: 'ice', strong_to: 'water', weak_to: 'fire', neutral: '', immune: 'ice')
lightning = Element.create!(name: 'lightning', strong_to: 'fire', weak_to: 'water', neutral: '', immune: 'lightning')

flame = Move.create!(name: 'flame', strength: 70, special: false, remaining_uses: 10)
flame.element = fire
flame.save

char = Monster.create!(name: 'charizard', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
char.element = fire
char.moves << flame
char.save