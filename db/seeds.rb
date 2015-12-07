# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Monster.delete_all
Element.delete_all
Move.delete_all

User.create!(email: "pikachu@example.example", password:"password", name:"pikachu")
User.create!(email: "pichu@example.example", password:"password", name:"pichu")

#nevin - can you please add the rest of the data in this way?--
## -- ELEMENTS
noelem = Element.create!(name: 'non-elemental', strong_to: '', weak_to: '', neutral: '', immune: '')
# fire = Element.create!(name: 'fire', strong_to: 'ice', weak_to: 'water', neutral: '', immune: 'fire')
# ice = Element.create!(name: 'ice', strong_to: 'water', weak_to: 'fire', neutral: '', immune: 'ice')
# lightning = Element.create!(name: 'lightning', strong_to: 'fire', weak_to: 'water', neutral: '', immune: 'lightning')
energy = Element.create!(name: 'energy' 'non-elemental', strong_to: 'metal', weak_to: 'water', neutral: '', immune: '')
fire = Element.create!(name: 'fire', strong_to: ['fire', 'water', 'earth'], weak_to: ['ice', 'air', 'metal'], neutral: '', immune: '')
water = Element.create!(name: 'water', strong_to: ['water', 'earth'], weak_to: ['energy', 'fire'], neutral: '', immune: '')
wood = Element.create!(name: 'wood', strong_to: 'metal', weak_to: 'earth', neutral: '', immune: '')
lightning = Element.create!(name: 'lightning', strong_to: 'air', weak_to: 'earth', neutral: '', immune: '')
ice = Element.create!(name: 'ice', strong_to: 'ice', weak_to: 'fire', neutral: '', immune: '')

earth = Element.create!(name: 'earth', strong_to: ['wood', 'lightning', 'earth'], weak_to: ['fire', 'water', 'metal'], neutral: '', immune: '')

air = Element.create!(name: 'air', strong_to: ['fire', 'metal'], weak_to: ['lightning', 'earth'], neutral: '', immune: '')
death = Element.create!(name: 'death', strong_to: ['energy', 'light'], weak_to: ['metal', 'life'], neutral: '', immune: '')
dark = Element.create!(name: 'dark', strong_to: 'dark', weak_to: 'light', neutral: '', immune: '')
metal = Element.create!(name: 'metal', strong_to: 'fire', weak_to: 'wood', neutral: '', immune: '')
light = Element.create!(name: 'light', strong_to: 'death', weak_to: 'dark', neutral: '', immune: '')
life = Element.create!(name: 'life', strong_to: 'life', weak_to: 'death', neutral: '', immune: '')

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

nuke = Move.create!(name: 'nuke', strength: 90, special: true, remaining_uses: 1)
nuke.element = ice
nuke.save

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