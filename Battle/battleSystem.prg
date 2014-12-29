include("Battle/battleFunctions.prg")
include("Battle/battleLibraries.prg")
include("Extend/Debug.prg")
include("Extend/Draw.prg")

// Debugging Mode
battleDebugActive = 0

// Temp
debugLog()
strAdd = "partyCount = "+partyCount+", battleAllyCount = "+battleAllyCount
debugLogAdd(strAdd)
strAdd = "battleAllyAnimFileImage[1][Idle] = "+battleAllyAnimFileImage[1]["Idle"]
debugLogAdd(strAdd)
strAdd = "battleAllyAnimPosX[1] = "+battleAllyAnimPosX[1]+", battleAllyAnimPosY[1] = "+battleAllyAnimPosY[1]
debugLogAdd(strAdd)
strAdd = "battleAllyAnimPosX[2] = "+battleAllyAnimPosX[2]+", battleAllyAnimPosY[2] = "+battleAllyAnimPosY[2]
debugLogAdd(strAdd)
strAdd = "battleAllyAnimPosX[3] = "+battleAllyAnimPosX[3]+", battleAllyAnimPosY[3] = "+battleAllyAnimPosY[3]
debugLogAdd(strAdd)
kill(strAdd)
//

:Battle
battleIdle()
branch(:BattleAdvance)

//---------------------------------------------------> Main Loop

:BattleAdvance
battleAdvance()
branch(:BattleReady)

:BattleReady
battleIdle()

// Debug
if(gameDebug==1)
{
	drawTextLeft("Allies","",600,300)
	drawTextLeft(battleAllyTimeWait[1],"",600,335)
	drawTextLeft(battleAllyTimeWait[2],"",600,370)
}
//

intResult = battleGetReadyAllies()
if(intResult>0)
{
	battleActiveArmy = 1
	battleActiveUnit = intResult
	branch(:BattleReadyAllies)
}
intResult = battleGetReadyEnemies()
if(intResult>0)
{
	battleActiveArmy = 2
	battleActiveUnit = intResult
	branch(:BattleReadyEnemies)
}
branch(:BattleAdvance)

//---------------------------------------------------> Ally Turn

:BattleReadyAllies
battleStatusCheckIdle(battleActiveArmy,battleActiveUnit)
branch(:BattleMenu)

//---------------------------------------------------> Enemy Turn

:BattleReadyEnemies
* consult the battleEnemyTechPlan[1]
// Temp
result = random(2)
if(result==1)
{
	battleAction("Attack")
	battleAction = "Attack"
	battleActionRenderName = ""
	battleActionSourceArmy = 2
	battleActionSourceUnit = 1
	battleActionTargetArmy = 1
	battleActionTargetUnit = 1
	battleActionDamageBase = 24
	battleActionDamageType = "Melee"
	battleActionDamageDraw = "Standard"
	battleActionChanceMiss = 1
	battleActionChanceGuard = 1
	battleActionChanceCritcial = 1
	battleActionStatusEffect = ""
}
else
{
	battleAction("MouldyClub")
	battleAction = "Mouldy Club"
	battleActionRenderName = "Mouldy Club"
	battleActionSourceArmy = 2
	battleActionSourceUnit = 1
	battleActionTargetArmy = 1
	battleActionTargetUnit = 1
	battleActionDamageBase = 14
	battleActionDamageType = "Melee"
	battleActionDamageDraw = "Standard"
	battleActionChanceMiss = 1
	battleActionChanceGuard = 1
	battleActionChanceCritcial = 1
	battleActionStatusEffect = "Poison"
	battleActionStatusChance = 75
	battleActionStatusTarget = "Enemy"
}
branch(:BattleAction)

//---------------------------------------------------> Command Menu

:BattleMenu
battleDrawInfoHighlight = battleActiveUnit
battleMenuCommands(battleActiveUnit)
branch(:BattleMenuDraw)

:BattleMenuDraw
battleMenuCommandsDraw()
branch(:BattleMenuWait)

:BattleMenuWait
intResult = battleMenuCommandsWait()
if(intResult==1){branch(:BattleMenuDraw)}
if(intResult==2){branch(:BattleMenuSelect)}
if(intResult==3){branch(:BattleMenuConfig)}
if(intResult==4){branch(:BattleMenuExtra)}
branch(:BattleMenuWait)

:BattleMenuSelect
battleMenuCommandsSelect()
battleDrawInfoHighlight = 0
branch(:BattleTargetMenu)

//---------------------------------------------------> Character Menu

:BattleSwitch
battleMenuSwitch(battleActiveUnit)
branch(:BattleSwitchDraw)

:BattleSwitchDraw
battleMenuSwitchDraw()
branch(:BattleSwitchWait)

:BattleSwitchWait
intResult = battleMenuSwitchWait()
if(intResult==1){branch(:BattleSwitchDraw)}
if(intResult==2){branch(:BattleSwitchSelect)}
if(intResult==3){branch(:BattleSwitchBack)}
branch(:BattleSwitchWait)

:BattleSwitchSelect
* change active unit with selected unit
* animate this and update data
battleMenuSwitchKill()
branch(:BattleMenu)

:BattleSwitchBack
battleMenuSwitchKill()
branch(:BattleMenu)

//---------------------------------------------------> Sub Menu

:BattleSubmenu
branch(:BattleSubmenuDraw)

:BattleSubmenuDraw
branch(:BattleSubmenuWait)

:BattleSubmenuWait
key = wait()
if(key=="ENTER" || key==" ")
{
	// Temp
	battleAction = "Fire"
}
branch(:BattleSubmenuWait)

//---------------------------------------------------> Target Menu

:BattleTargetMenu
battleMenuTarget(2)
branch(:BattleTargetMenuDraw)

:BattleTargetMenuDraw
battleMenuTargetDraw()
branch(:BattleTargetMenuWait)

:BattleTargetMenuWait
result = battleMenuTargetWait()
if(result==1){branch(:BattleTargetMenuDraw)}
if(result==2){branch(:BattleTargetMenuSelect)}
if(result==3){branch(:BattleTargetMenuBack)}
branch(:BattleTargetMenuWait)

:BattleTargetMenuSelect
intArmy = battleMenuTargetGetArmy()
intUnit = battleMenuTargetGetUnitAtPos()
battleActionSetTarget(intArmy,intUnit)
kill(intArmy)
kill(intUnit)
battleMenuTargetKill()
branch(:BattleAction)

:BattleTargetMenuBack
battleMenuTargetKill()
branch(:BattleMenu)

//---------------------------------------------------> Action

:BattleAction
battleIdle()
battleActionCalculateDamage()
battleActionCalculateStatusEffect()
battleActionExecute()

// Temp: Action Build New
frame = 1

// Temp: Enemy
if(battleActionSourceArmy==2)
{
	tempFile = "foeBandit01AtkA"
	frameMax = 6
}

// Temp: Action
for(frame=1;frame<=frameMax;frame=frame+1)
{
	battleView()
	battleViewDelay[frame] = 0.1
	if(battleActionSourceArmy==1)
	{
		battleViewUnitAnim[battleActionSourceArmy][battleActionSourceUnit] = battleAllyAnimFileImage[battleActionSourceUnit]["ATK1"] + frame
	}
	if(battleActionSourceArmy==2)
	{
		*battleViewUnitAnim[battleActionSourceArmy][battleActionSourceUnit] = battleEnemyAnimFileImage[battleActionSourceUnit]["ATK1"] + frame
		battleViewUnitAnim[battleActionSourceArmy][battleActionSourceUnit] = tempFile + frame
	}
	
	// Temp
	if(battleActionRenderName~="" && frame<=5)
	{
		battleViewMessage()
	}
	battleViewBuild(frame)
}

// Temp: Damage (1)
frameMax = frameMax + 1
frame = frameMax
tempDamageOffset = 0
battleView()
battleViewDamage()
battleViewDelay[frame] = 0.2
battleViewBuild(frame)

// Temp: Damage (2)
frameMax = frameMax + 1
frame = frameMax
tempDamageOffset = 5
battleView()
battleViewDamage()
battleViewDelay[frame] = 0.2
battleViewBuild(frame)

// Temp: Damage (3)
frameMax = frameMax + 1
frame = frameMax
tempDamageOffset = 10
battleView()
battleViewDamage()
battleViewDelay[frame] = 0.2
battleViewBuild(frame)

// Temp: Damage (4)
frameMax = frameMax + 1
frame = frameMax
tempDamageOffset = 15
battleView()
battleViewDamage()
battleViewDelay[frame] = 0.2
battleViewBuild(frame)

// Temp: Status (disabled for now)
if(battleActionStatusEffectInflict==1 && 1==2)
{
	frameMax = frameMax + 1
	frame = frameMax
	battleView()
	battleViewDelay[frame] = 0.5
	battleViewUnitAnim[battleActionTargetArmy][battleActionTargetUnit] = "allyPlayerPoison1"
	battleViewStatus()
	battleViewBuild(frame)
	//
	frameMax = frameMax + 1
	frame = frameMax
	battleView()
	battleViewDelay[frame] = 1
	battleViewStatus()
	battleViewBuild(frame)
}

// Temp: Action Render
for(frame=1;frame<=frameMax;frame=frame+1)
{
	battleViewRender(frame)
	// Temp
	/*debugString = "FRAME "+frame+" / "+frameMax+" (DELAY "+battleViewDelay[frame]+")"
	drawTextCentreScreen(debugString,"",200)
	wait()*/
	//
	delay(battleViewDelay[frame])
}

// Temp: Inflict Damage
if(battleActionTargetArmy==1)
{
	battleAllyStatHPC[battleActionTargetUnit] = battleAllyStatHPC[battleActionTargetUnit] - battleActionDamageTotal
	if(battleAllyStatHPC[battleActionTargetUnit]<1)
	{
		battleAllyStatHPC[battleActionTargetUnit] = 0
		battleAllyStatus[battleActionTargetUnit]["KO"] = 1
	}
}
if(battleActionTargetArmy==2)
{
	battleEnemyStatHPC[battleActionTargetUnit] = battleEnemyStatHPC[battleActionTargetUnit] - battleActionDamageTotal
	if(battleEnemyStatHPC[battleActionTargetUnit]<1)
	{
		battleEnemyStatHPC[battleActionTargetUnit] = 0
		battleEnemyStatus[battleActionTargetUnit]["KO"] = 1

		* note: if the target has just been knocked-out then should we even consider status effects afterwards?

		// Temp: Build Death Anim
		for(frame=1;frame<=7;frame=frame+1)
		{
			battleView()
			battleViewUnitAnim[2][battleActionTargetUnit] = "foeBandit01Die" + frame
			battleViewBuild(frame)
		}
		
		// Temp: Draw Death Anim
		for(frame=1;frame<=7;frame=frame+1)
		{
			battleViewRender(frame)
			frameDelay = 0.1
			delay(frameDelay)
		}
	}
}

// Temp: Inflict Status (disabled for now)
if(battleActionStatusEffectInflict==1 && 1==2)
{
	* note: check if the target is immune? (or resists?) - this should be done earlier
	if(battleActionTargetArmy==1)
	{
		battleAllyStatus[battleActionTargetUnit][battleActionStatusEffect] = 1
	}
	if(battleActionTargetArmy==2)
	{
		battleEnemyStatus[battleActionTargetUnit][battleActionStatusEffect] = 1
	}
}
branch(:BattleActionDone)

:BattleActionDone
battleActionWait()
battleActionKill()
branch(:BattleCheckArmies)

:BattleUnitDefend
battleActionSourceUnit = battleActiveUnit
* move this up and make it a proper action, with a message and effect
battleAllyTimeWait[battleActionSourceUnit] = battleAllyTimeWait[battleActionSourceUnit] + 5
branch(:BattleCheckArmies)

:BattleCheckArmies
* NOTE: units are not counted if they are dead, turned to stone, frozen in time, etc...
intResult = battleCheckAllies()
if(intResult<1){branch(:BattleDefeat)}
intResult = battleCheckEnemies()
if(intResult<1){branch(:BattleVictory)}
kill(intResult)
branch(:BattleReady)

//---------------------------------------------------> Victory

:BattleVictory
battleGetReward()
run("Battle/battleVictory.prg")

//---------------------------------------------------> Defeat

:BattleDefeat
battleDefeat()

//---------------------------------------------------> Temp

:BattleTempSummon
frame = 1
frameMax = 8
battleActionMessage = "Phoenix"

// Temp: Action Build
for(frame=1;frame<=frameMax;frame=frame+1)
{
	battleView()
	battleViewSummon()
	battleViewSummonAnim = "allyPhoenixIdle1"
	if(frame>2 && frame<8)
	{
		battleViewSummonAnim = "allyPhoenixAtkA" + frame
	}
	*if(battleActionMessage~="" && frame<=5)
	*{
		*battleViewMessage()
	*}
	battleViewBuild(frame)
}

// Temp: Action Render
for(frame=1;frame<=frameMax;frame=frame+1)
{
	battleViewRender(frame)
	frameDelay = 0.1
	if(frame==frameMax){frameDelay = 1}
	*delay(frameDelay)
	wait()
}
*wait()
windows()

:BattleTempFireAnim
frame = 1
frameMax = 7
for(frame=1;frame<=frameMax;frame=frame+1)
{
	image = "Battle\Effects\fireBurn"+frame+".png"
	battleView()
	battleViewLayerAnim(2,1,image)
	battleViewBuild(frame)
}
for(frame=1;frame<=frameMax;frame=frame+1)
{
	battleViewRender(frame)
	delay(0.2)
}
battleIdle()
wait()
windows()
