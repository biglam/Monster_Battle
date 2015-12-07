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
#noelem = Element.create!(name: 'non-elemental', strong_to: '', weak_to: '', neutral: '', immune: '')
energy = Element.create!(name: 'energy' 'non-elemental', strong_to: 'metal', weak_to: 'water', neutral: '', immune: '')
fire = Element.create!(name: 'fire', strong_to: ['fire', 'water', 'earth'], weak_to: ['ice', 'air', 'metal'], neutral: '', immune: )
water = Element.create!(name: 'water', strong_to: ['water', 'earth'], weak_to: ['energy', 'fire'], neutral: '', immune: '')
wood = Element.create!(name: 'wood', strong_to: 'metal', weak_to: 'earth', neutral: '', immune: '')
lightning = Element.create!(name: 'lightning', strong_to: 'air', weak_to: 'earth', neutral: '', immune: )
ice = Element.create!(name: 'ice', strong_to: 'ice', weak_to: 'fire', neutral: '', immune: )
earth = Element.create!(name: 'earth', strong_to: ['wood', 'lightning', 'earth]' weak_to: ['fire', 'water', 'metal'], neutral: '', immune: '')
air = Element.create!(name: 'air', strong_to: ['fire', 'metal'], weak_to: ['lightning', 'earth'], neutral: '', immune: '')
death = Element.create!(name: 'death', strong_to: ['energy', 'light'] weak_to: ['metal', 'life'], neutral: '', immune: '')
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

= Move.create!(name: 'Atom Bane', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Battler Reaction', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Blast Lance', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Blasting Reactor', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Crashing Reaction', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Force Assault', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Fusion Blast', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Neutron Fusion', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Reaction Fusion', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Way Strike', strength: 90, special: true, remaining_uses: 1)

= Move.create!(name: 'Barrage Burner', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Blast Crashing', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Bolt Battler', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Firey Crashing', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Flaming Blaze', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Hot Barrage', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Mars Blaze', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Omni Cremator', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Pyro Crasher', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Volcano Flash', strength: 90, special: true, remaining_uses: 1)

= Move.create!(name: 'Bane Torrent', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Battler Bane', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Blast Rush', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Crashing Spray', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Neptune Jet', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Posedion Waterspout', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Power Attack', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Rain Flash', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Reaction Blast', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'True Rush', strength: 90, special: true, remaining_uses: 1)

= Move.create!(name: 'Botanical Attack', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Crashing Bane', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Floral Beam', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Jungle Attack', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Pollenation Bolt', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Power Bolt', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Timber Bane', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'True Bloom', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Way Crashing', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Wood Assault', strength: 90, special: true, remaining_uses: 1)

= Move.create!(name: 'Bane Electrocutioner', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Blast Crasher', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Blazing Assault', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Flash Lightning', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Fusion Crasher', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Lance Blast', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Pulse Lightning', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Thunder Battler', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Voltage Shocker', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Zap Blaze', strength: 90, special: true, remaining_uses: 1)

= Move.create!(name: 'Arctic Blizzard', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Blasting Blizzard', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Blizzard Way', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Cold Chill', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Crashing Bolt', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Energy Frost', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Freezing Assault', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Fusion Battler', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Icicle Chill', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'True Freezer', strength: 90, special: true, remaining_uses: 1)

= Move.create!(name: 'Bane Flash', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Battler Avalanche', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Blasting Flash', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Crystal Lance', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Fault Blaster', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Force Avalanche', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Gemstone Attack', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Terra Bane', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Tremor Barrage', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'True Landslide', strength: 90, special: true, remaining_uses: 1)

= Move.create!(name: 'Assault Barrage', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Bane Beam', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Barrage Flash', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Battler Whirlwind', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Blasting Crashing', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Bolt Attack', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Cyclone Bolt', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Flash Monsoon', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Flying Blaster', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Monsoon Barrage', strength: 90, special: true, remaining_uses: 1)

= Move.create!(name: 'Battler Rot', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Blast Assault', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Crashing Rot', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Deadly Bane', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Executioner Rot', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Funerary Way', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Fusion Funeral', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Killing Crasher', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Necro Blast', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'True Barrage', strength: 90, special: true, remaining_uses: 1)

= Move.create!(name: 'Black Strike', strength: 90, special: true, remaining_uses: 1)
= Move.create!(name: 'Blast Shadow'
= Move.create!(name: 'Crashing Strike'
= Move.create!(name: 'Darkness Attack'
= Move.create!(name: 'Ebony Shade'
= Move.create!(name: 'Lance Way'
= Move.create!(name: 'Night Beam'
= Move.create!(name: 'Power Shade'
= Move.create!(name: 'Shade Strike'
= Move.create!(name: 'Way Shade'

= Move.create!(name: 'Battler Wheel'
= Move.create!(name: 'Bolt Assault'
= Move.create!(name: 'Bolt Barrage'
= Move.create!(name: 'Machinery Attack'
= Move.create!(name: 'Mecha Device'
= Move.create!(name: 'Mechanical Crasher'
= Move.create!(name: 'Mechano Flash'
= Move.create!(name: 'Motorized Gadgetry'
= Move.create!(name: 'Omni Attack'
= Move.create!(name: 'Technology Bane'

= Move.create!(name: 'Bane Fusion'
= Move.create!(name: 'Blast Flicker'
= Move.create!(name: 'Blazing Strike'
= Move.create!(name: 'Flicker Blaster'
= Move.create!(name: 'Gleaming Power'
= Move.create!(name: 'Light Flash'
= Move.create!(name: 'Omni Gleam'
= Move.create!(name: 'Ray Beam'
= Move.create!(name: 'Spark Gleam'
= Move.create!(name: 'True Glow'

= Move.create!(name: 'Doctor Antidote'
= Move.create!(name: 'Doctor Cure'
= Move.create!(name: 'Heal Strike'
= Move.create!(name: 'Life Crashing'
= Move.create!(name: 'Medical Therapy'
= Move.create!(name: 'Omni Bolt'
= Move.create!(name: 'Peaceful Fusion'
= Move.create!(name: 'Repairing Battler'
= Move.create!(name: 'Restoring Antidote'
= Move.create!(name: 'Vitality Healer'



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