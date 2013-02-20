-- Generated by wz2lua (data file)
version(0) -- version of the script API this script is written for
-- slo: "cam2CX.slo"

-- VLO  file for making civilians appear and get hearded to LZ for pickup by enemy transports
-- Also makes civilians become player controlled when they're near enough and no enemies nearby

-- cam2CX.VLO

player = 0
enemy = 2
scavs = 7

wayX = {}
wayX[0] = 1600
wayY = {}
wayY[0] = 11968
wayX[1] = 2752
wayY[1] = 11328
wayX[2] = 3264
wayY[2] = 12096
wayX[3] = 3648
wayY[3] = 11456
wayX[4] = 4160
wayY[4] = 11968
-- 4160
wayX[5] = 4228
-- 10560
wayY[5] = 10688
-- 4672
wayX[6] = 5440
-- 11072
wayY[6] = 11072
wayX[7] = 0
wayY[7] = 0
wayX[8] = 0
wayY[8] = 0
wayX[9] = 0
wayY[9] = 0

-- "BaBaPeople"
civilian = "BaBaCivilian"
cyborg = "Cyb-Chain-GROUND"
-- for enemy transports
transporter = "Transporter"
warnSnd = "pcv395.ogg"
-- "Civilian Rescued"
rescueSnd = "pcv612.ogg"
-- "Enemy escaping"
badSnd = "pcv632.ogg"

LZX = 6464
LZY = 10816
-- where to order Civs (a bit further into LZ
LZoneX = 6592
LZoneY = 10816
LZRange = 384
-- 768	//6 tile radius rescue check area from centre of civ group
capRange = 512
-- protection zone to stop transport
LZX1 = 5568
LZY1 = 9792
LZX2 = 7616
LZY2 = 11968

-- 64	//64	//trigger region when near LZ and cyborg groups
trigX1 = 64
-- 7104	//6080	//7104
trigY1 = 8640
-- 7616	//9280	//7616	//region increased
trigX2 = 8128
-- 14912	//12608
trigY2 = 12608

-- 704	//base area to be cleared before given civ brief
baseX1 = 64
-- 192	//same as base blip region
baseY1 = 64
-- 4160
baseX2 = 6848
-- 4288	//needs to be same as base blip 0 in normal script!!!
baseY2 = 5568

playerLZX = 11200
playerLZY = 12864

entryX = 1
entryY = 80
exitX = 1
exitY = 80
numGroups = 1
groupX1 = {}
groupX1[0] = 704
groupY1 = {}
groupY1[0] = 10560
-- 1344
groupX2 = {}
groupX2[0] = 1728
-- 11200
groupY2 = {}
groupY2[0] = 11456
repNum = 1
-- number of times to repeat
repTot = 4
-- 35	//number of civilians that need to escape to lose
escCivs = 59
groupWayStart = {}
groupWayStart[0] = 0
groupWayEnd = {}
groupWayEnd[0] = 6

incomingSnd = "pcv455.ogg"
brief = "MB2_C_MSG2"
-- Transport
objective = "C2C_OBJ2"

-- extra 30mins for civ rescue
timeLimit = 18000

--run the code
dofile('cam2cx_logic.lua')