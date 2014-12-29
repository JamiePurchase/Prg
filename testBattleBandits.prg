include("Battle/battleFunctions.prg")

// Create Battle
battle("Wild","Test")

// Enemy Army
battleEnemyCount = 1

// Enemy 1
battleEnemyInfoName[1] = "Bandit A"
battleEnemyStatHPC[1] = 60
battleEnemyStatHPM[1] = 60
battleEnemyTimeWait[1] = 3
battleEnemyTimePlus[1] = 15
battleEnemyAnimFileImage[1]["Idle"] = "foeBandit01Idle"
battleEnemyAnimFileCount[1]["Idle"] = 1
battleEnemyAnimPosX[1] = 100
battleEnemyAnimPosY[1] = 200
battleEnemyAnimWide[1] = 100
battleEnemyAnimHigh[1] = 100
battleEnemyTechPlan[1] = "Bandit01"
battleEnemyLootExps[1] = 12
battleEnemyLootGoldMin[1] = 5
battleEnemyLootGoldMax[1] = 24
battleEnemyLootItem[1] = 0

battleEnemyInfoName[2] = "Boar"
battleEnemyStatHPC[2] = 240
battleEnemyStatHPM[2] = 240
battleEnemyTimeWait[2] = 6
battleEnemyTimePlus[2] = 15
battleEnemyAnimFileImage[2]["Idle"] = "foeBoar01Idle"
battleEnemyAnimFileCount[2]["Idle"] = 1
battleEnemyAnimPosX[2] = 100
battleEnemyAnimPosY[2] = 300
battleEnemyAnimWide[2] = 100
battleEnemyAnimHigh[2] = 100
battleEnemyTechPlan[2] = "Boar01"
battleEnemyLootExps[2] = 22
battleEnemyLootGoldMin[2] = 0
battleEnemyLootGoldMax[2] = 0
battleEnemyLootItem[2] = 0

// Enemy 2
/*battleEnemyInfoName[2] = "Bandit B"
battleEnemyStatHPC[2] = 60
battleEnemyStatHPM[2] = 60
battleEnemyTimeWait[2] = 3
battleEnemyTimePlus[2] = 30
battleEnemyAnimFileImage[2]["Idle"] = "foeBandit01Idle"
battleEnemyAnimFileCount[2]["Idle"] = 1
battleEnemyAnimPosX[2] = 100
battleEnemyAnimPosY[2] = 300
battleEnemyAnimWide[2] = 100
battleEnemyAnimHigh[2] = 100
battleEnemyTechPlan[2] = "Bandit01"
battleEnemyLootExps[2] = 12
battleEnemyLootGoldMin[2] = 5
battleEnemyLootGoldMax[2] = 24
battleEnemyLootItem[2] = 0*/

// System
run("Battle/battleLoad.prg")

