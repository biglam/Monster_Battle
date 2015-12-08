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


AtomBane=Move.create!(name: 'Atom Bane', strength: 10, special: false, remaining_uses: 10)
AtomBane.element= energy
AtomBane.save
BattlerReaction=Move.create!(name: 'Battler Reaction', strength: 20, special: false, remaining_uses: 9)
BattlerReaction.element = energy
BattlerReaction.save
BlastLance=Move.create!(name: 'Blast Lance', strength: 30, special: false, remaining_uses: 8)
BlastLance.element = energy
BlastLance.save
BlastingReactor=Move.create!(name: 'Blasting Reactor', strength: 40, special: false, remaining_uses: 7)
BlastingReactor.element = energy
BlastingReactor.save
CrashingReaction=Move.create!(name: 'Crashing Reaction', strength: 50, special: false, remaining_uses: 6)
CrashingReaction.element = energy
CrashingReaction.save
ForceAssault=Move.create!(name: 'Force Assault', strength: 60, special: false, remaining_uses: 5)
ForceAssault.element = energy
ForceAssault.save
FusionBlast=Move.create!(name: 'Fusion Blast', strength: 70, special: false, remaining_uses: 4)
FusionBlast.element = energy
FusionBlast.save
NeutronFusion=Move.create!(name: 'Neutron Fusion', strength: 80, special: false, remaining_uses: 3)
NeutronFusion.element = energy
NeutronFusion.save
ReactionFusion=Move.create!(name: 'Reaction Fusion', strength: 90, special: false, remaining_uses: 2)
ReactionFusion.element = energy
ReactionFusion.save
WayStrike=Move.create!(name: 'Way Strike', strength: 100, special: false, remaining_uses: 1)
WayStrike.element= energy
WayStrike.save

BarrageBurner=Move.create!(name: 'Barrage Burner', strength: 10, special: false, remaining_uses: 10)
BarrageBurner.element = fire
BarrageBurner.save
BlastCrashing=Move.create!(name: 'Blast Crashing', strength: 20, special: false, remaining_uses: 9)
BlastCrashing.element = fire
BlastCrashing.save
BoltBattler=Move.create!(name: 'Bolt Battler', strength: 30, special: false, remaining_uses: 8)
BoltBattler.element = fire
BoltBattler.save
FireyCrashing=Move.create!(name: 'Firey Crashing', strength: 40, special: false, remaining_uses: 7)
FireyCrashing.element = fire
FireyCrashing.save
FlamingBlaze=Move.create!(name: 'Flaming Blaze', strength: 50, special: false, remaining_uses: 6)
FlamingBlaze.element = fire
FlamingBlaze.save
HotBarrage=Move.create!(name: 'Hot Barrage', strength: 60, special: false, remaining_uses: 5)
HotBarrage.element = fire
HotBarrage.save
MarsBlaze=Move.create!(name: 'Mars Blaze', strength: 70, special: false, remaining_uses: 4)
MarsBlaze.element= fire
MarsBlaze.save
OmniCremator=Move.create!(name: 'Omni Cremator', strength: 80, special: false, remaining_uses: 3)
OmniCremator.element = fire
OmniCremator.save
PyroCrasher=Move.create!(name: 'Pyro Crasher', strength: 90, special: false, remaining_uses: 2)
PyroCrasher.element = fire
PyroCrasher.save
VolcanoFlash=Move.create!(name: 'Volcano Flash', strength: 100, special: false, remaining_uses: 1)
VolcanoFlash.element = fire
VolcanoFlash.save

BaneTorrent=Move.create!(name: 'Bane Torrent', strength: 10, special: false, remaining_uses: 10)
BaneTorrent.element = water
BaneTorrent.save
BattlerBane=Move.create!(name: 'Battler Bane', strength: 20, special: false, remaining_uses: 9)
BattlerBane.element = water
BattlerBane.save
BlastRush=Move.create!(name: 'Blast Rush', strength: 30, special: false, remaining_uses: 8)
BlastRush.element= water
BlastRush.save
CrashingSpray=Move.create!(name: 'Crashing Spray', strength: 40, special: false, remaining_uses: 7)
CrashingSpray.element = water
CrashingSpray.save
NeptuneJet=Move.create!(name: 'Neptune Jet', strength: 50, special: false, remaining_uses: 6)
NeptuneJet.element = water
NeptuneJet.save
PosedionWaterspout= Move.create!(name: 'Posedion Waterspout', strength: 60, special: false, remaining_uses: 5)
PosedionWaterspout.element = water
PosedionWaterspout.save
PowerAttack=Move.create!(name: 'Power Attack', strength: 70, special: false, remaining_uses: 4)
PowerAttack.element = water
PowerAttack.save
RainFlash=Move.create!(name: 'Rain Flash', strength: 80, special: false, remaining_uses: 3)
RainFlash.element= water
RainFlash.save
ReactionBlast=Move.create!(name: 'Reaction Blast', strength: 90, special: false, remaining_uses: 2)
ReactionBlast.element = water
ReactionBlast.save
TrueRush=Move.create!(name: 'True Rush', strength: 100, special: false, remaining_uses: 1)
TrueRush.element= water
TrueRush.save

BotanicalAttack=Move.create!(name: 'Botanical Attack', strength: 10, special: false, remaining_uses: 10)
BotanicalAttack.element = wood
BotanicalAttack.save
CrashingBane=Move.create!(name: 'Crashing Bane', strength: 20, special: false, remaining_uses: 9)
CrashingBane.element = wood
CrashingBane.save
FloralBeam=Move.create!(name: 'Floral Beam', strength: 30, special: false, remaining_uses: 8)
FloralBeam.element = wood
FloralBeam.save
JungleAttack=Move.create!(name: 'Jungle Attack', strength: 40, special: false, remaining_uses: 7)
JungleAttack.element = wood
JungleAttack.save
PollenationBolt=Move.create!(name: 'Pollenation Bolt', strength: 50, special: false, remaining_uses: 6)
PollenationBolt.element = wood
PollenationBolt.save
PowerBolt=Move.create!(name: 'Power Bolt', strength: 60, special: false, remaining_uses: 5)
PowerBolt.element= wood
PowerBolt.save
TimberBane=Move.create!(name: 'Timber Bane', strength: 70, special: false, remaining_uses: 4)
TimberBane.element = wood
TimberBane.save
TrueBloom=Move.create!(name: 'True Bloom', strength: 80, special: false, remaining_uses: 3)
TrueBloom.element= wood
TrueBloom.save
WayCrashing=Move.create!(name: 'Way Crashing', strength: 90, special: false, remaining_uses: 2)
WayCrashing.element = wood
WayCrashing.save
WoodAssault=Move.create!(name: 'Wood Assault', strength: 100, special: false, remaining_uses: 1)
WoodAssault.element = wood
WoodAssault.save

BaneElectrocutioner= Move.create!(name: 'Bane Electrocutioner', strength: 10, special: false, remaining_uses: 10)
BaneElectrocutioner.element = lightning
BaneElectrocutioner.save
BlastCrasher=Move.create!(name: 'Blast Crasher', strength: 20, special: false, remaining_uses: 9)
BlastCrasher.element = lightning
BlastCrasher.save
BlazingAssault=Move.create!(name: 'Blazing Assault', strength: 30, special: false, remaining_uses: 8)
BlazingAssault.element = lightning
BlazingAssault.save
FlashLightning=Move.create!(name: 'Flash Lightning', strength: 40, special: false, remaining_uses: 7)
FlashLightning.element = lightning
FlashLightning.save
FusionCrasher=Move.create!(name: 'Fusion Crasher', strength: 50, special: false, remaining_uses: 6)
FusionCrasher.element = lightning
FusionCrasher.save
LanceBlast=Move.create!(name: 'Lance Blast', strength: 60, special: false, remaining_uses: 5)
LanceBlast.element = lightning
LanceBlast.save
PulseLightning=Move.create!(name: 'Pulse Lightning', strength: 70, special: false, remaining_uses: 4)
PulseLightning.element = lightning
PulseLightning.save
ThunderBattler=Move.create!(name: 'Thunder Battler', strength: 80, special: false, remaining_uses: 3)
ThunderBattler.element = lightning
ThunderBattler.save
VoltageShocker=Move.create!(name: 'Voltage Shocker', strength: 90, special: false, remaining_uses: 2)
VoltageShocker.element = lightning
VoltageShocker.save
ZapBlaze=Move.create!(name: 'Zap Blaze', strength: 100, special: false, remaining_uses: 1)
ZapBlaze.element= lightning
ZapBlaze.save

ArcticBlizzard=Move.create!(name: 'Arctic Blizzard', strength: 10, special: false, remaining_uses: 10)
ArcticBlizzard.element = ice
ArcticBlizzard.save
BlastingBlizzard=Move.create!(name: 'Blasting Blizzard', strength: 20, special: false, remaining_uses: 9)
BlastingBlizzard.element = ice
BlastingBlizzard.save
BlizzardWay=Move.create!(name: 'Blizzard Way', strength: 30, special: false, remaining_uses: 8)
BlizzardWay.element = ice
BlizzardWay.save
ColdChill=Move.create!(name: 'Cold Chill', strength: 40, special: false, remaining_uses: 7)
ColdChill.element= ice
ColdChill.save
CrashingBolt=Move.create!(name: 'Crashing Bolt', strength: 50, special: false, remaining_uses: 6)
CrashingBolt.element = ice
CrashingBolt.save
EnergyFrost=Move.create!(name: 'Energy Frost', strength: 60, special: false, remaining_uses: 5)
EnergyFrost.element = ice
EnergyFrost.save
FreezingAssault=Move.create!(name: 'Freezing Assault', strength: 70, special: false, remaining_uses: 4)
FreezingAssault.element = ice
FreezingAssault.save
FusionBattler=Move.create!(name: 'Fusion Battler', strength: 80, special: false, remaining_uses: 3)
FusionBattler.element = ice
FusionBattler.save
IcicleChill=Move.create!(name: 'Icicle Chill', strength: 90, special: false, remaining_uses: 2)
IcicleChill.element = ice
IcicleChill.save
TrueFreezer=Move.create!(name: 'True Freezer', strength: 100, special: false, remaining_uses: 1)
TrueFreezer.element = ice
TrueFreezer.save

BaneFlash=Move.create!(name: 'Bane Flash', strength: 10, special: false, remaining_uses: 10)
BaneFlash.element= earth
BaneFlash.save
BattlerAvalanche=Move.create!(name: 'Battler Avalanche', strength: 20, special: false, remaining_uses: 9)
BattlerAvalanche.element = earth
BattlerAvalanche.save
BlastingFlash=Move.create!(name: 'Blasting Flash', strength: 30, special: false, remaining_uses: 8)
BlastingFlash.element = earth
BlastingFlash.save
CrystalLance=Move.create!(name: 'Crystal Lance', strength: 40, special: false, remaining_uses: 7)
CrystalLance.element = earth
CrystalLance.save
FaultBlaster=Move.create!(name: 'Fault Blaster', strength: 50, special: false, remaining_uses: 6)
FaultBlaster.element = earth
FaultBlaster.save
ForceAvalanche=Move.create!(name: 'Force Avalanche', strength: 60, special: false, remaining_uses: 5)
ForceAvalanche.element = earth
ForceAvalanche.save
GemstoneAttack=Move.create!(name: 'Gemstone Attack', strength: 70, special: false, remaining_uses: 4)
GemstoneAttack.element = earth
GemstoneAttack.save
TerraBane=Move.create!(name: 'Terra Bane', strength: 80, special: false, remaining_uses: 3)
TerraBane.element= earth
TerraBane.save
TremorBarrage=Move.create!(name: 'Tremor Barrage', strength: 90, special: false, remaining_uses: 2)
TremorBarrage.element = earth
TremorBarrage.save
TrueLandslide=Move.create!(name: 'True Landslide', strength: 100, special: false, remaining_uses: 1)
TrueLandslide.element = earth
TrueLandslide.save

AssaultBarrage=Move.create!(name: 'Assault Barrage', strength: 10, special: false, remaining_uses: 10)
AssaultBarrage.element = air
AssaultBarrage.save
BaneBeam=Move.create!(name: 'Bane Beam', strength: 20, special: false, remaining_uses: 9)
BaneBeam.element= air
BaneBeam.save
BarrageFlash=Move.create!(name: 'Barrage Flash', strength: 30, special: false, remaining_uses: 8)
BarrageFlash.element = air
BarrageFlash.save
BattlerWhirlwind=Move.create!(name: 'Battler Whirlwind', strength: 40, special: false, remaining_uses: 7)
BattlerWhirlwind.element = air
BattlerWhirlwind.save
BlastingCrashing=Move.create!(name: 'Blasting Crashing', strength: 50, special: false, remaining_uses: 6)
BlastingCrashing.element = air
BlastingCrashing.save
BoltAttack=Move.create!(name: 'Bolt Attack', strength: 60, special: false, remaining_uses: 5)
BoltAttack.element = air
BoltAttack.save
CycloneBolt=Move.create!(name: 'Cyclone Bolt', strength: 70, special: false, remaining_uses: 4)
CycloneBolt.element = air
CycloneBolt.save
FlashMonsoon=Move.create!(name: 'Flash Monsoon', strength: 80, special: false, remaining_uses: 3)
FlashMonsoon.element = air
FlashMonsoon.save
FlyingBlaster=Move.create!(name: 'Flying Blaster', strength: 90, special: false, remaining_uses: 2)
FlyingBlaster.element = air
FlyingBlaster.save
MonsoonBarrage=Move.create!(name: 'Monsoon Barrage', strength: 100, special: false, remaining_uses: 1)
MonsoonBarrage.element = air
MonsoonBarrage.save

BattlerRot=Move.create!(name: 'Battler Rot', strength: 10, special: false, remaining_uses: 10)
BattlerRot.element = death
BattlerRot.save
BlastAssault=Move.create!(name: 'Blast Assault', strength: 20, special: false, remaining_uses: 9)
BlastAssault.element = death
BlastAssault.save
CrashingRot=Move.create!(name: 'Crashing Rot', strength: 30, special: false, remaining_uses: 8)
CrashingRot.element = death
CrashingRot.save
DeadlyBane=Move.create!(name: 'Deadly Bane', strength: 40, special: false, remaining_uses: 7)
DeadlyBane.element = death
DeadlyBane.save
ExecutionerRot=Move.create!(name: 'Executioner Rot', strength: 50, special: false, remaining_uses: 6)
ExecutionerRot.element = death
ExecutionerRot.save
FuneraryWay=Move.create!(name: 'Funerary Way', strength: 60, special: false, remaining_uses: 5)
FuneraryWay.element = death
FuneraryWay.save
FusionFuneral=Move.create!(name: 'Fusion Funeral', strength: 70, special: false, remaining_uses: 4)
FusionFuneral.element = death
FusionFuneral.save
KillingCrasher=Move.create!(name: 'Killing Crasher', strength: 80, special: false, remaining_uses: 3)
KillingCrasher.element = death
KillingCrasher.save
NecroBlast=Move.create!(name: 'Necro Blast', strength: 90, special: false, remaining_uses: 2)
NecroBlast.element = death
NecroBlast.save
TrueBarrage=Move.create!(name: 'True Barrage', strength: 100, special: false, remaining_uses: 1)
TrueBarrage.element = death
TrueBarrage.save

BlackStrike=Move.create!(name: 'Black Strike', strength: 10, special: false, remaining_uses: 10)
BlackStrike.element = dark
BlackStrike.save
BlastShadow=Move.create!(name: 'Blast Shadow', strength: 20, special: false, remaining_uses: 9)
BlastShadow.element = dark
BlastShadow.save
CrashingStrike=Move.create!(name: 'Crashing Strike', strength: 30, special: false, remaining_uses: 8)
CrashingStrike.element = dark
CrashingStrike.save
DarknessAttack=Move.create!(name: 'Darkness Attack', strength: 40, special: false, remaining_uses: 7)
DarknessAttack.element = dark
DarknessAttack.save
EbonyShade=Move.create!(name: 'Ebony Shade', strength: 50, special: false, remaining_uses: 6)
EbonyShade.element = dark
EbonyShade.save
LanceWay=Move.create!(name: 'Lance Way', strength: 60, special: false, remaining_uses: 5)
LanceWay.element= dark
LanceWay.save
NightBeam=Move.create!(name: 'Night Beam', strength: 70, special: false, remaining_uses: 4)
NightBeam.element= dark
NightBeam.save
PowerShade=Move.create!(name: 'Power Shade', strength: 80, special: false, remaining_uses: 3)
PowerShade.element = dark
PowerShade.save
ShadeStrike=Move.create!(name: 'Shade Strike', strength: 90, special: false, remaining_uses: 2)
ShadeStrike.element = dark
ShadeStrike.save
WayShade=Move.create!(name: 'Way Shade', strength: 100, special: false, remaining_uses: 1)
WayShade.element= dark
WayShade.save

BattlerWheel=Move.create!(name: 'Battler Wheel', strength: 10, special: false, remaining_uses: 10)
BattlerWheel.element = metal
BattlerWheel.save
BoltAssault=Move.create!(name: 'Bolt Assault', strength: 20, special: false, remaining_uses: 9)
BoltAssault.element = metal
BoltAssault.save
BoltBarrage=Move.create!(name: 'Bolt Barrage', strength: 30, special: false, remaining_uses: 8)
BoltBarrage.element = metal
BoltBarrage.save
MachineryAttack=Move.create!(name: 'Machinery Attack', strength: 40, special: false, remaining_uses: 7)
MachineryAttack.element = metal
MachineryAttack.save
MechaDevice=Move.create!(name: 'Mecha Device', strength: 50, special: false, remaining_uses: 6)
MechaDevice.element = metal
MechaDevice.save
MechanicalCrasher= Move.create!(name: 'Mechanical Crasher', strength: 60, special: false, remaining_uses: 5)
MechanicalCrasher.element = metal
MechanicalCrasher.save
MechanoFlash=Move.create!(name: 'Mechano Flash', strength: 70, special: false, remaining_uses: 4)
MechanoFlash.element = metal
MechanoFlash.save
MotorizedGadgetry= Move.create!(name: 'Motorized Gadgetry', strength: 80, special: false, remaining_uses: 3)
MotorizedGadgetry.element = metal
MotorizedGadgetry.save
OmniAttack=Move.create!(name: 'Omni Attack', strength: 90, special: false, remaining_uses: 2)
OmniAttack.element = metal
OmniAttack.save
TechnologyBane=Move.create!(name: 'Technology Bane', strength: 100, special: false, remaining_uses: 1)
TechnologyBane.element = metal
TechnologyBane.save

BaneFusion=Move.create!(name: 'Bane Fusion', strength: 10, special: false, remaining_uses: 10)
BaneFusion.element = light
BaneFusion.save
BlastFlicker=Move.create!(name: 'Blast Flicker', strength: 20, special: false, remaining_uses: 9)
BlastFlicker.element = light
BlastFlicker.save
BlazingStrike=Move.create!(name: 'Blazing Strike', strength: 30, special: false, remaining_uses: 8)
BlazingStrike.element = light
BlazingStrike.save
FlickerBlaster=Move.create!(name: 'Flicker Blaster', strength: 40, special: false, remaining_uses: 7)
FlickerBlaster.element = light
FlickerBlaster.save
GleamingPower=Move.create!(name: 'Gleaming Power', strength: 50, special: false, remaining_uses: 6)
GleamingPower.element = light
GleamingPower.save
LightFlash=Move.create!(name: 'Light Flash', strength: 60, special: false, remaining_uses: 5)
LightFlash.element = light
LightFlash.save
OmniGleam=Move.create!(name: 'Omni Gleam', strength: 70, special: false, remaining_uses: 4)
OmniGleam.element= light
OmniGleam.save
RayBeam=Move.create!(name: 'Ray Beam', strength: 80, special: false, remaining_uses: 3)
RayBeam.element=light
RayBeam.save
SparkGleam=Move.create!(name: 'Spark Gleam', strength: 90, special: false, remaining_uses: 2)
SparkGleam.element = light
SparkGleam.save
TrueGlow=Move.create!(name: 'True Glow', strength: 100, special: false, remaining_uses: 1)
TrueGlow.element= light
TrueGlow.save

DoctorAntidote=Move.create!(name: 'Doctor Antidote', strength: 10, special: false, remaining_uses: 10)
DoctorAntidote.element = life
DoctorAntidote.save
DoctorCure=Move.create!(name: 'Doctor Cure', strength: 20, special: false, remaining_uses: 9)
DoctorCure.element = life
DoctorCure.save
HealStrike=Move.create!(name: 'Heal Strike', strength: 30, special: false, remaining_uses: 8)
HealStrike.element = life
HealStrike.save
LifeCrashing=Move.create!(name: 'Life Crashing', strength: 40, special: false, remaining_uses: 7)
LifeCrashing.element = life
LifeCrashing.save
MedicalTherapy=Move.create!(name: 'Medical Therapy', strength: 50, special: false, remaining_uses: 6)
MedicalTherapy.element = life
MedicalTherapy.save
OmniBolt=Move.create!(name: 'Omni Bolt', strength: 60, special: false, remaining_uses: 5)
OmniBolt.element= life
OmniBolt.save
PeacefulFusion=Move.create!(name: 'Peaceful Fusion', strength: 70, special: false, remaining_uses: 4)
PeacefulFusion.element = life
PeacefulFusion.save
RepairingBattler=Move.create!(name: 'Repairing Battler', strength: 80, special: false, remaining_uses: 3)
RepairingBattler.element = life
RepairingBattler.save
RestoringAntidote= Move.create!(name: 'Restoring Antidote', strength: 90, special: false, remaining_uses: 2)
RestoringAntidote.element = life
RestoringAntidote.save
VitalityHealer=Move.create!(name: 'Vitality Healer', strength: 100, special: false, remaining_uses: 1)
VitalityHealer.element = life
VitalityHealer.save


#char = Monster.create!(name: 'charizard', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
#char.element = fire
#char.moves << [RayBeam, MechanoFlash, BattlerWheel, BoltAssault]
#char.save

#colddude = Monster.create!(name: 'colddude', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
#colddude.element = ice
#colddude.moves << [PeacefulFusion, WayShade, CrashingStrike, BlastLance]
#colddude.save

art = Monster.create!(name: 'articuno', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
art.element = ice
art.moves << [ArcticBlizzard, BlastingBlizzard, BlizzardWay, ColdChill, CrashingBolt, EnergyFrost, FreezingAssault, FusionBattler, IcicleChill, TrueFreezer]
art.save

blast = Monster.create!(name: 'blastoise', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
blast.element = water
blast.moves << [BaneTorrent, BattlerBane, BlastRush, CrashingSpray, NeptuneJet, PosedionWaterspout, PowerAttack, RainFlash, ReactionBlast, TrueRush]
blast.save

bulb = Monster.create!(name: 'bulb', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
bulb.element = wood
bulb.moves << [BotanicalAttack, CrashingBane, FloralBeam, JungleAttack, PollenationBolt, PowerBolt, TimberBane, TrueBloom, WayCrashing, WoodAssault]
bulb.save

char = Monster.create!(name: 'charizard', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
char.element = fire
char.moves << [BarrageBurner, BlastCrashing, BoltBattler, FireyCrashing, FlamingBlaze, HotBarrage, MarsBlaze, OmniCremator, PyroCrasher, VolcanoFlash]
char.save

cle = Monster.create!(name: 'clefairy', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
cle.element = light
cle.moves << [BaneFusion, BlastFlicker, BlazingStrike, FlickerBlaster, GleamingPower, LightFlash, OmniGleam, RayBeam, SparkGleam, TrueGlow]
cle.save

dra = Monster.create!(name: 'dragonite', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
dra.element = earth
dra.moves << [BaneFlash, BattlerAvalanche, BlastingFlash, CrystalLance, FaultBlaster, ForceAvalanche, GemstoneAttack, TerraBane, TremorBarrage, TrueLandslide]
dra.save

lat = Monster.create!(name: 'latios', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
lat.element = death
lat.moves << [BattlerRot, BlastAssault, CrashingRot, DeadlyBane, ExecutionerRot, FuneraryWay, FusionFuneral, KillingCrasher, NecroBlast, TrueBarrage]
lat.save

luc = Monster.create!(name: 'lucario', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
luc.element = metal
luc.moves << [BattlerWheel, BoltAssault, BoltBarrage, MachineryAttack, MechaDevice, MechanicalCrasher, MechanoFlash, MotorizedGadgetry, OmniAttack, TechnologyBane]
luc.save

lug = Monster.create!(name: 'lugia', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
lug.element = air
lug.moves << [AssaultBarrage, BaneBeam, BarrageFlash, BattlerWhirlwind, BlastingCrashing, BoltAttack, CycloneBolt, FlyingBlaster, MonsoonBarrage]
lug.save

mew = Monster.create!(name: 'mew', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
mew.element = life
mew.moves << [DoctorAntidote, DoctorCure, HealStrike, LifeCrashing, MedicalTherapy, OmniBolt, PeacefulFusion, RepairingBattler, RestoringAntidote, VitalityHealer]
mew.save

pika = Monster.create!(name: 'pikachu', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
pika.element = lightning
pika.moves << [BaneElectrocutioner, BlastCrasher, BlazingAssault, FlashLightning, FusionCrasher, LanceBlast, PulseLightning, ThunderBattler, VoltageShocker, ZapBlaze]
pika.save

ty = Monster.create!(name: 'tyranitar', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
ty.element = dark
ty.moves << [BlackStrike, BlastShadow, CrashingStrike, DarknessAttack, EbonyShade, LanceWay, NightBeam, PowerShade, ShadeStrike, WayShade]
ty.save

zap = Monster.create!(name: 'zapdos', image_front: nil, image_back: nil, strike_sound: nil, hurt_sound: nil)
zap.element = energy
zap.moves << [AtomBane, BattlerReaction, BlastLance, BlastingReactor, CrashingReaction, ForceAssault, FusionBlast, NeutronFusion, ReactionFusion, WayStrike]
zap.save