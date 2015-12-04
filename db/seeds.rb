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


#nevin - can you please add the rest of the data in this way?--
## -- ELEMENTS
noelem = Element.create!(name: 'non-elemental', strong_to: '', weak_to: '', neutral: '', immune: '')
fire = Element.create!(name: 'fire', strong_to: 'ice', weak_to: 'water', neutral: '', immune: 'fire')
ice = Element.create!(name: 'ice', strong_to: 'water', weak_to: 'fire', neutral: '', immune: 'ice')
lightning = Element.create!(name: 'lightning', strong_to: 'fire', weak_to: 'water', neutral: '', immune: 'lightning')

## -- MOVES
punch = Move.create!(name: 'punch', strength: 50, special: false, remaining_uses: 10)
punch.element = noelem
punch.save

flame = Move.create!(name: 'flame', strength: 50, special: false, remaining_uses: 10)
flame.element = fire
flame.save

explode = Move.create!(name: 'explode', strength: 80, special: false, remaining_uses: 5)
explode.element = fire
explode.save

snowflake = Move.create!(name: 'snowflake', strength: 30, special: false, remaining_uses: 15)
snowflake.element = ice
snowflake.save

blizzard = Move.create!(name: 'blizzard', strength: 70, special: false, remaining_uses: 8)
blizzard.element = ice
blizzard.save

#graeme if you have any images to add to monsters, URL's can go in the strings here
## -- MONSTERS
char = Monster.create!(name: 'charizard', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
char.element = fire
char.moves << [flame, explode, punch]
char.save

colddude = Monster.create!(name: 'colddude', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
colddude.element = ice
colddude.moves << [blizzard, snowflake, punch]
colddude.save