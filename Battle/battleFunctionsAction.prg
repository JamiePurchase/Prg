function battleAction(stringAction)
{
	battleAction = stringAction
	battleActionRenderName = ""
	battleActionSourceArmy = 0
	battleActionSourceUnit = 0
	battleActionTargetArmy = 0
	battleActionTargetUnit = 0
	battleActionDamageBase = 0
	battleActionDamageType = ""
	battleActionDamageDraw = ""
	battleActionDamageTotal = 0
	battleActionStatusCritical = 0
	battleActionStatusCriticalChance = 0
	battleActionStatusEffect = ""
	battleActionStatusEffectChance = 0
	battleActionStatusEffectInflict = 0
	battleActionStatusGuard = 0
	battleActionStatusGuardChance = 0
	battleActionStatusMiss = 0
	battleActionStatusMissChance = 0
	battleActionStatusReflect = 0
	battleActionStatusReflectChance = 0
	battleActionTimingWait = 5
	battleActionVisualImages = ""
	battleActionVisualFrames = 0
	kill(stringAction)
}

function battleActionCalculateDamage()
{
	// Basic Damage
	intDamage = battleActionDamageBase
	
	// Critical Hit
	battleActionCritical = 0
	if(battleActionChanceCritical==1)
	{
		intCritical = random(100)
		if(intCritical>=90)
		{
			intDamage = intDamage * 1.5
			battleActionCritical = 1
		}
	}
	
	// Random Extra
	intExtra = random(9)
	intDamage = intDamage + intExtra
	
	// Final Amount
	battleActionDamageTotal = intDamage
	
	// Kill Variables
	kill(intDamage)
	kill(intExtra)
}

function battleActionCalculateStatusEffect()
{
	if(battleActionStatusEffect~="")
	{
		intResult = random(100)
		if(intResult<=battleActionStatusChance)
		{
			battleActionStatusEffectInflict = 1
		}
	}
	kill(intResult)
}

function battleActionExecute()
{
	// Build Animation
	intFrame = 1
	intFrameMax = battle
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
}

function battleActionKill()
{
	kill(battleAction)
	kill(battleActionRenderName)
	kill(battleActionSourceArmy)
	kill(battleActionSourceUnit)
	kill(battleActionTargetArmy)
	kill(battleActionTargetUnit)
	kill(battleActionDamageBase)
	kill(battleActionDamageType)
	kill(battleActionDamageDraw)
	kill(battleActionDamageTotal)
	kill(battleActionStatusCritical)
	kill(battleActionStatusCriticalChance)
	kill(battleActionStatusEffect)
	kill(battleActionStatusEffectChance)
	kill(battleActionStatusEffectInflict)
	kill(battleActionStatusGuard)
	kill(battleActionStatusGuardChance)
	kill(battleActionStatusMiss)
	kill(battleActionStatusMissChance)
	kill(battleActionStatusReflect)
	kill(battleActionStatusReflectChance)
	kill(battleActionTimingWait)
	kill(battleActionVisualImages)
	kill(battleActionVisualFrames)
}

function battleActionSetDamage(strType,intDamage,strDraw)
{
	battleActionDamageType = strType
	battleActionDamageBase = intDamage
	battleActionDamageDraw = strDraw
	kill(strType)
	kill(intDamage)
	kill(strDraw)
}

function battleActionSetVisual(strFile,intFrames)
{
	battleActionVisualImages = strFile
	battleActionVisualFrames = intFrames
	kill(strFile)
	kill(intFrames)
}

function battleActionSetRenderName(stringName)
{
	battleActionRenderName = stringName
	kill(stringName)
}

function battleActionSetSource(intArmy,intUnit)
{
	battleActionSourceArmy = intArmy
	battleActionSourceUnit = intUnit
	kill(intArmy)
	kill(intUnit)
}

function battleActionSetStatusCriticalChance(intChance)
{
	battleActionStatusCriticalChance = intChance
	kill(intChance)
}

function battleActionSetStatusGuardChance(intChance)
{
	battleActionStatusGuardChance = intChance
	kill(intChance)
}

function battleActionSetStatusMissChance(intChance)
{
	battleActionStatusMissChance = intChance
	kill(intChance)
}

function battleActionSetStatusReflectChance(intChance)
{
	battleActionStatusReflectChance = intChance
	kill(intChance)
}

function battleActionSetTarget(intArmy,intUnit)
{
	battleActionTargetArmy = intArmy
	battleActionTargetUnit = intUnit
	kill(intArmy)
	kill(intUnit)
}

function battleActionWait()
{
	if(battleActionSourceArmy==1)
	{
		battleAllyTimeWait[battleActionSourceUnit] = battleAllyTimeWait[battleActionSourceUnit] + battleActionTimingWait
	}
	if(battleActionSourceArmy==2)
	{
		battleEnemyTimeWait[battleActionSourceUnit] = battleEnemyTimeWait[battleActionSourceUnit] + battleActionTimingWait
	}
}

