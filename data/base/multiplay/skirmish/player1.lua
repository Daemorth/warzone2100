-- Generated by wz2lua (data file)
version(0) -- version of the script API this script is written for
-- slo: "player1.slo"

---------------------------------------------------------------------
-- ai for skirmish game
-- Generic vlo for each computer player
---------------------------------------------------------------------

-- research branches
branchDefault = 0
branchVTOL = 1

-- this player is player x.
me = 1

-- default branch
-- min number of droids in group to aim for.
numScouts = {}
numScouts[0] = 3
numDefenders = {}
numDefenders[0] = 4
numAttackers = {}
numAttackers[0] = 8
-- build cyborgs until scouts contains x droids
numCyborgs = {}
numCyborgs[0] = 15

-- vtol branch
-- min number of droids in group to aim for.
numScouts[1] = 3
numDefenders[1] = 12
numAttackers[1] = 0
-- build cyborgs until scouts contains x droids
numCyborgs[1] = 25

-- default branch
-- min number of droids in group to aim for.
maxScouts = {}
maxScouts[0] = 3
maxDefenders = {}
maxDefenders[0] = 5
maxAttackers = {}
maxAttackers[0] = -1
-- build cyborgs until scouts contains x droids
maxCyborgs = {}
maxCyborgs[0] = 35

-- vtol branch
-- min number of droids in group to aim for.
maxScouts[1] = 3
maxDefenders[1] = 20
maxAttackers[1] = 0
-- build cyborgs until scouts contains x droids
maxCyborgs[1] = 50

-- approx minutes to expand over the map.
tileExpand = 12

---------------------------------------------------------------------
---------------------------------------------------------------------
-- structures

-- generic names, often used.
oilRes = "OilResource"
resLab = "A0ResearchFacility"
powGen = "A0PowerGenerator"
factory = "A0LightFactory"
derrick = "A0ResourceExtractor"
cybFactory = "A0CyborgFactory"
playerHQ = "A0CommandCentre"
vtolPad = "A0VtolPad"
vtolFactory = "A0VTolFactory1"
repairFacility = "A0RepairCentre3"
sensorTower = "Sys-SensoTower02"
lassat = "A0LasSatCommand"
nexusDefence = "R-Sys-Resistance-Circuits"
uplink = "A0Sat-linkCentre"

-- number of research topics for each research branch
techCount = {}
techCount[0] = 5

-- how many res facilities to use when finished researching all specified research topics
maxIdleRes = {}
maxIdleRes[0] = -1

-- HMG
tech = {}
tech[0] = {}
tech[0][0] = "R-Wpn-MG3Mk1"
-- mini rocket artillery
tech[0][1] = "R-Wpn-Rocket02-MRL"
tech[0][2] = "R-Wpn-Rocket-ROF03"
tech[0][3] = "R-Wpn-MG-Damage03"
-- lancer bunker
tech[0][4] = "R-Defense-Pillbox06"

-- other tech: R-Vehicle-Prop-VTOL, R-Struc-VTOLPad, R-Struc-VTOLFactory
techCount[1] = 27

-- how many res facilities to use when finished researching all specified research topics
maxIdleRes[1] = 3

tech[1] = {}
tech[1][0] = "R-Struc-VTOLFactory"
tech[1][1] = "R-Struc-VTOLPad"
-- HMG
tech[1][2] = "R-Wpn-MG3Mk1"
-- Machine gunner
tech[1][3] = "R-Cyborg-Wpn-MG"

-- mini rocket artillery
tech[1][4] = "R-Wpn-Rocket02-MRL"
tech[1][5] = "R-Wpn-Rocket-ROF03"

-- mechanic
tech[1][6] = "R-Cyborg-Sys-Mechanic"
-- cyb engineer
tech[1][7] = "R-Cyborg-Sys-ComEng"
-- flamer
tech[1][8] = "R-Cyborg-Wpn-Flamer"
-- flamer damage 03
tech[1][9] = "R-Wpn-Flamer-Damage03"
-- flamer ROF 03
tech[1][10] = "R-Wpn-Flamer-ROF03"

-- heavy gunner
tech[1][11] = "R-Cyborg-Wpn-Cannon"
-- Lancer
tech[1][12] = "R-Wpn-Rocket01-LtAT"
-- Cyborg Lancer
tech[1][13] = "R-Cyborg-Wpn-Rocket"
-- Scorpion body
tech[1][14] = "R-Vehicle-Body08"
-- power upgrade 03a
tech[1][15] = "R-Struc-Power-Upgrade03a"
-- lancer accuracy
tech[1][16] = "R-Wpn-RocketSlow-Accuracy03"
-- lancer damage 06 (all 6 can be researched at once)
tech[1][17] = "R-Wpn-RocketSlow-Damage06"

-- assault gunner
tech[1][18] = "R-Cyborg-Wpn-RotMG-Grd"

-- BB
tech[1][19] = "R-Wpn-Rocket03-HvAT"
-- needle gunner
tech[1][20] = "R-Cyborg-Wpn-Rail1-Grd"
tech[1][21] = "R-Struc-VTOLPad-Upgrade06"
tech[1][22] = "R-Struc-VTOLFactory-Upgrade06"
-- autorepair
tech[1][23] = "R-Sys-Autorepair-General"
tech[1][24] = "R-Sys-Sensor-UpLink"
tech[1][25] = "R-Sys-VTOLCBS-Turret01"
tech[1][26] = "R-Sys-VTOLStrike-Tower01"

-- tech[1][5]		RESEARCHSTAT			"R-Vehicle-Body04"				// Bug body

maxVtolFacs = {}
maxVtolFacs[0] = 1
maxVtolFacs[1] = 4

maxVTOLs = {}
maxVTOLs[0] = 5
maxVTOLs[1] = 70

-- incendry emplacements.
numIncendrys = 8
incendrys = {}
incendrys[0] = "Emplacement-MortarPit01"
incendrys[1] = "Emplacement-MortarPit02"
incendrys[2] = "Emplacement-MortarPit-Incenediary"
incendrys[3] = "Emplacement-RotMor"
incendrys[4] = "Emplacement-Howitzer105"
incendrys[5] = "Emplacement-Howitzer150"
incendrys[6] = "Emplacement-Howitzer-Incenediary"
incendrys[7] = "Emplacement-RotHow"

-- anti a.
-- 1
vtolDefStruct = {}
vtolDefStruct[0] = "AASite-QuadMg1"
-- 2
vtolDefStruct[1] = "AASite-QuadBof"
vtolDefStruct[2] = "AASite-QuadRotMg"
-- 3
vtolDefStruct[3] = "P0-AASite-SAM1"
vtolDefStruct[4] = "P0-AASite-SAM2"

-- upgrade structures
powModule = "A0PowMod1"
facModule = "A0FacMod1"
resModule = "A0ResearchModule1"

-- Essential structs.
numStructs = 13
structs = {}
structs[0] = "A0PowerGenerator"
structs[1] = "A0LightFactory"
structs[2] = "A0CommandCentre"
structs[3] = "A0ResearchFacility"
structs[4] = "A0CyborgFactory"

structs[5] = "Sys-CB-Tower01"
structs[6] = "Sys-SpyTower"

structs[7] = "A0LasSatCommand"
structs[8] = "A0Sat-linkCentre"
structs[9] = "X-Super-Rocket"
structs[10] = "X-Super-Cannon"
structs[11] = "X-Super-MassDriver"
structs[12] = "X-Super-Missile"

-- Base structures
numBaseStruct = 8
baseStruct = {}
baseStruct[0] = "A0PowerGenerator"
baseStruct[1] = "A0LightFactory"
baseStruct[2] = "A0CommandCentre"
baseStruct[3] = "A0ResearchFacility"
baseStruct[4] = "A0CyborgFactory"
baseStruct[5] = "A0LasSatCommand"
baseStruct[6] = "A0Sat-linkCentre"
baseStruct[7] = "A0VTolFactory1"

-- defensive structs.
numDefStructs = 22
defStructs = {}
defStructs[0] = "PillBox1"
defStructs[1] = "Pillbox-RotMG"
defStructs[3] = "GuardTower6"
-- LC
defStructs[2] = "PillBox4"
-- Lancer
defStructs[4] = "PillBox6"
defStructs[5] = "Sys-SensoTower02"
-- MC
defStructs[6] = "WallTower03"
-- HC
defStructs[7] = "WallTower04"
-- Lancer
defStructs[8] = "PillBox6"

-- HC
defStructs[9] = "WallTower04"
defStructs[10] = "WallTower-HPVcannon"
defStructs[11] = "Emplacement-Howitzer105"
defStructs[12] = "Emplacement-HvyATrocket"
defStructs[13] = "Emplacement-MortarPit02"
defStructs[14] = "WallTower06"
-- Campaign 3 Defensive Structures
defStructs[15] = "Emplacement-PulseLaser"
defStructs[16] = "Emplacement-Rail2"

-- TK
defStructs[17] = "WallTower-HvATrocket"
-- Scourge
defStructs[18] = "WallTower-Atmiss"
defStructs[19] = "WallTower-PulseLas"
defStructs[20] = "WallTower-Rail2"
defStructs[21] = "WallTower-Rail3"

-- wall structs (4)
numWallWeaps = 10
wall = "A0HardcreteMk1Wall"
cornerWall = "A0HardcreteMk1CWall"
wallWeaps = {}
wallWeaps[0] = "WallTower01"
wallWeaps[1] = "WallTower02"
wallWeaps[2] = "WallTower03"
wallWeaps[3] = "WallTower04"
wallWeaps[4] = "WallTower06"
wallWeaps[5] = "WallTower06"
wallWeaps[6] = "WallTower-Rail2"
wallWeaps[7] = "WallTower-PulseLas"
wallWeaps[8] = "WallTower-Atmiss"
wallWeaps[9] = "WallTower-HPVcannon"

-- extra structs
numExtraStructs = {}
numExtraStructs[0] = 5
extraStructs = {}
extraStructs[0] = {}
extraStructs[0][0] = "A0LightFactory"
extraStructs[0][1] = "A0RepairCentre3"
extraStructs[0][2] = "A0LightFactory"
extraStructs[0][3] = "A0ResearchFacility"
extraStructs[0][4] = "A0CyborgFactory"

numExtraStructs[1] = 5
extraStructs[1] = {}
extraStructs[1][0] = "A0VTolFactory1"
extraStructs[1][1] = "A0VTolFactory1"
extraStructs[1][2] = "A0CyborgFactory"
extraStructs[1][3] = "A0VtolPad"
extraStructs[1][4] = "A0LightFactory"

---------------------------------------------------------------------
---------------------------------------------------------------------
-- SKIRMISH TEMPLATES

-- COMBAT TEMPLATES

-- branchDefault
numTemplates = {}
numTemplates[0] = 47

-- MG
tmpl = {}
tmpl[0] = {}
tmpl[0][0] = "ViperMG01Wheels"
-- TMG
tmpl[0][1] = "ViperMG02Wheels"
-- HMG
tmpl[0][2] = "ViperHMGWheels"
-- POD
tmpl[0][3] = "ViperPODWheels"
-- Lancer
tmpl[0][4] = "ViperLtA-Twheels"
-- Flamer
tmpl[0][5] = "ViperFlameWheels"
-- Lancer
tmpl[0][6] = "ViperLtA-Twheels"
-- MRL
tmpl[0][7] = "CobraMRLHalftrack"
-- LC
tmpl[0][8] = "ViperLtCannonWheels"
-- POD
tmpl[0][9] = "ViperPODWheels"
-- LC
tmpl[0][10] = "ViperLtCannonHTracks"

-- Lancer	HT
tmpl[0][11] = "CobraLtA-Thalftrack"
-- MRL 	HT
tmpl[0][12] = "CobraMRLHalftrack"
-- Inferno	HT
tmpl[0][13] = "CobraInfernoHTracks"
-- Lancer	H
tmpl[0][14] = "SK-Cobra-Hover-Lancer"
-- BB		H
tmpl[0][15] = "Sk-CobraBBHover"
-- MC		Tr
tmpl[0][16] = "CobraMedCnTrks"
-- HVC	Tr
tmpl[0][17] = "SK-Cobra-Track-HVC"
-- HC		Tr
tmpl[0][18] = "CobraHvyCnTrks"

-- tmpl[0][19]	TEMPLATE	"SK-Python-Hover-Mcannon"
-- tmpl[0][20]	TEMPLATE	"PythonMedCnTrks"
-- tmpl[0][21]	TEMPLATE	"SK-Python-Hover-Lancer"
-- tmpl[0][22]	TEMPLATE	"SK-Python-Hover-Hcannon"

-- Campaign 2
-- HVC Hover
tmpl[0][19] = "PythonHoverHVC"
tmpl[0][20] = "SK-Cobra-Track-TK"
tmpl[0][21] = "Sk-PythonHvCanTrack"
tmpl[0][22] = "Sk-PythonHvCanTrack"

tmpl[0][23] = "SK-Panther-Hover-HVC"
tmpl[0][24] = "SK-Panther-Hover-TK"

tmpl[0][25] = "SK-Tiger-Track-Hcannon"
tmpl[0][26] = "SK-Tiger-Track-HVC"
tmpl[0][27] = "SK-Tiger-Track-Hcannon"
tmpl[0][28] = "SK-Tiger-Hover-TK"

-- Campaign 3
tmpl[0][29] = "SK-Leopard-Htrk-Needle"
tmpl[0][30] = "SK-Tiger-Track-Hcannon"
tmpl[0][31] = "SK-Panther-Track-RailGun"
tmpl[0][32] = "SK-Panther-Hover-TK"
tmpl[0][33] = "SK-Tiger-Track-Scourge"
tmpl[0][34] = "SK-Tiger-Track-Gauss"
tmpl[0][35] = "SK-Tiger-Hover-Gauss"
tmpl[0][36] = "SK-Retre-Track-PulseLsr"
tmpl[0][37] = "SK-Retre-Track-FlashLight"

tmpl[0][38] = "SK-Retre-Track-RailGun"
tmpl[0][39] = "SK-Veng-Track-Scourge"
tmpl[0][40] = "SK-Retre-Hover-RailGun"
tmpl[0][41] = "SK-Retre-Track-Scourge"
tmpl[0][42] = "SK-Veng-Track-Gauss"
tmpl[0][43] = "SK-Veng-Hover-Gauss"
tmpl[0][44] = "SK-Veng-Track-PulseLsr"
tmpl[0][45] = "SK-Veng-Hover-Scourge"

tmpl[0][46] = "SK-Veng-Track-HvyLaser"

-- branchVTOL
numTemplates[1] = 18

tmpl[1] = {}
tmpl[1][0] = "ViperMG01Wheels"
tmpl[1][1] = "ViperMG02Wheels"
tmpl[1][2] = "ViperHMGWheels"
tmpl[1][3] = "ViperHMGWheels"
tmpl[1][4] = "ViperLtA-Twheels"
tmpl[1][5] = "ViperHMGTracks"
tmpl[1][6] = "ViperLtA-Twheels"
tmpl[1][7] = "ViperLtA-Twheels"
tmpl[1][8] = "ViperHMGTracks"
tmpl[1][9] = "ViperHMGTracks"
tmpl[1][10] = "ViperMedCnTrks"

tmpl[1][11] = "SK-Cobra-Hover-HMG"
tmpl[1][12] = "SK-Cobra-Hover-Lancer"

tmpl[1][13] = "H-Scorp-Trk-Lancer"
tmpl[1][14] = "H-Scorp-Trk-HC"
tmpl[1][15] = "H-Scorp-Trk-Lancer"
tmpl[1][16] = "H-Scorp-Trk-HC"
tmpl[1][17] = "H-Scorp-Trk-Lancer"

---------------------------------------------------------------------
-- SENSORS / REPAIR TEMPLATES

constructor = "ConstructorDroid"
aiconstructor = "ConstructionDroid"
repairUnit = "ViperRepairHalftrack"

numSenseTemplates = 10

-- Campaign 1
sense = {}
sense[0] = "ViperRepairWheels"
sense[1] = "ViperRepairHalftrack"
sense[2] = "CobraSensorHalftrack"
-- Campaign 2
sense[3] = "SK-Bug-Hover-Sensor"
sense[4] = "SK-Bug-Hover-Repair"
sense[5] = "SK-Leopard-Hover-Sensor"
sense[6] = "SK-Leopard-Hover-Repair"
sense[7] = "SK-Panther-Track-Repair"
-- Campaign 3
sense[8] = "SK-Retal-Hover-Sensor"
sense[9] = "SK-Retal-Hover-Repair"

---------------------------------------------------------------------
-- cyborg templates
numLightCyborgs = 6
cybTempl = {}
cybTempl[0] = "CyborgChain01Ground"
-- heavy gunner
cybTempl[1] = "CyborgCannon01Grd"
cybTempl[2] = "CyborgFlamer01Grd"
cybTempl[3] = "CyborgRkt01Ground"
cybTempl[4] = "MP-Cyb-Needle-GRD"
cybTempl[5] = "MP-Cyb-Needle-GRD"

cybMechanic = "Cyb-Mechanic"
cybEngineer = "Cyb-ComEng"

superCyb = {}
superCyb[0] = "Cyb-Hvy-Mcannon"
superCyb[1] = "Cyb-Hvy-HPV"
superCyb[2] = "Cyb-Hvy-Acannon"
superCyb[3] = "Cyb-Hvy-TK"

---------------------------------------------------------------------
-- VTOL TEMPLATES

numVtolTemplates = 7

-- Viper Lancer
vtols = {}
vtols[0] = "P6-L-LTAT-V"
-- Viper Cluster Bombs Bay
vtols[1] = "P6-L-Bomb1-V"
vtols[2] = "SK-Bug-VTOL-CLBomb"
vtols[3] = "SK-Scorpion-VTOL-Hbomb"
vtols[4] = "H-Scorp-VTOL-Lancer"
vtols[5] = "H-Scorp-VTOL-BB"
vtols[6] = "H-Scorp-VTOL-Lancer"


numVtolTargets = 10

vtolTarget = {}
vtolTarget[0] = "A0CommandCentre"
vtolTargetWeight = {}
vtolTargetWeight[0] = 10
vtolTarget[1] = "A0LightFactory"
vtolTargetWeight[1] = 80
vtolTarget[2] = "A0CyborgFactory"
vtolTargetWeight[2] = 60
vtolTarget[3] = "A0VTolFactory1"
vtolTargetWeight[3] = 70
vtolTarget[4] = "A0LasSatCommand"
vtolTargetWeight[4] = 40
vtolTarget[5] = "A0Sat-linkCentre"
vtolTargetWeight[5] = 90
vtolTarget[6] = "A0ResearchFacility"
vtolTargetWeight[6] = 55
vtolTarget[7] = "A0PowerGenerator"
vtolTargetWeight[7] = 95
vtolTarget[8] = "A0ResourceExtractor"
vtolTargetWeight[8] = 100
vtolTarget[9] = "A0RepairCentre3"
vtolTargetWeight[9] = 20

-- Structure types AI will rebuild when they get destroyed (per tech branch basis)

-- branchDefault
numRebuildStat = {}
numRebuildStat[0] = 2
rebuildStat = {}
rebuildStat[0] = {}
rebuildStat[0][0] = "A0HardcreteMk1Wall"
rebuildStat[0][1] = "A0HardcreteMk1CWall"

-- branchVTOL
numRebuildStat[1] = 2
rebuildStat[1] = {}
rebuildStat[1][0] = "A0HardcreteMk1Wall"
rebuildStat[1][1] = "A0HardcreteMk1CWall"

--run the code
dofile('player1_logic.lua')