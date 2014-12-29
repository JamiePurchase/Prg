function battleMenuTarget(intArmy)
{
	// Create Target Menu
	battleMenuTargetPos = 1
	battleMenuTargetMax = 0
	battleMenuTargetOptArmy = intArmy

	// Create Options
	if(intArmy==1){intMax = battleAllyCount}
	if(intArmy==2){intMax = battleEnemyCount}
	for(intUnit=1;intUnit<=intMax;intUnit=intUnit+1)
	{
		if(intArmy==1)
		{
			if(battleAllyStatus[intUnit]["KO"]<1)
			{
				battleMenuTargetMax = battleMenuTargetMax + 1
				battleMenuTargetSetUnit(battleMenuTargetMax,intUnit)
			}
		}
		if(intArmy==2)
		{
			if(battleEnemyStatus[intUnit]["KO"]<1)
			{
				battleMenuTargetMax = battleMenuTargetMax + 1
				battleMenuTargetSetUnit(battleMenuTargetMax,intUnit)
			}
		}
	}

	// Create Canvas
	battleMenuTargetBuild()

	// Kill Variables
	kill(intArmy)
	kill(intMax)
	kill(intUnit)
}

function battleMenuTargetBuild()
{
	battleIdle()
	createCanvas(1366,768,battleMenuTargetCanvas)
	canvasGetScreen(battleMenuTargetCanvas)
	for(intPosition=1;intPosition<=battleMenuTargetMax;intPosition=intPosition+1)
	{
		// Create Canvas
		createCanvas(1366,768,battleMenuTargetOptCanvas[intPosition])
		drawCanvas(battleMenuTargetCanvas,0,0,1366,768,battleMenuTargetOptCanvas[intPosition])

		// Draw Options
		for(intUnit=1;intUnit<=battleMenuTargetMax;intUnit=intUnit+1)
		{
			// Get Unit Details
			intUnitId = battleMenuTargetGetUnit(intPosition)
			if(battleMenuTargetOptArmy==1){stringText = battleAllyInfoName[intUnitId]}
			if(battleMenuTargetOptArmy==2){stringText = battleEnemyInfoName[intUnitId]}

			// Get Position
			intPosX = 35
			intPosY = 35 * intUnit + 535

			// Drw Option Background
			artColour("OptionStandard")
			if(intPosition==intUnit){artColour("OptionActive")}
			fillRect(intPosX,intPosY,intPosX+280,intPosY+35,battleMenuTargetOptCanvas[intPosition])

			// Draw Option Border
			artColour("OptionBorder")
			drawRect(intPosX,intPosY,intPosX+280,intPosY+1,battleMenuTargetOptCanvas[intPosition])
			drawRect(intPosX,intPosY+34,intPosX+280,intPosY+35,battleMenuTargetOptCanvas[intPosition])

			// Draw Option Text
			artTextCentre(stringText,"BattleTextShadow",151,intPosY+1,battleMenuTargetOptCanvas[intPosition])
			artTextCentre(stringText,"BattleTextShadow",152,intPosY+2,battleMenuTargetOptCanvas[intPosition])
			artTextCentre(stringText,"BattleTextStandard",150,intPosY,battleMenuTargetOptCanvas[intPosition])

			// Kill Variables
			kill(intPosX)
			kill(intPosY)
		}

		// Kill Variables
		kill(intUnit)
	}

	// Kill Variables
	kill(intPosition)
}

function battleMenuTargetDraw()
{
	drawCanvas(battleMenuTargetOptCanvas[battleMenuTargetPos],0,0)
}

function battleMenuTargetGetArmy()
{
	return(battleMenuTargetOptArmy)
}

function battleMenuTargetGetUnit(intPosition)
{
	intUnit = battleMenuTargetOptUnit[intPosition]
	kill(intPosition)
	return(intUnit)
}

function battleMenuTargetGetUnitAtPos()
{
	return(battleMenuTargetOptUnit[battleMenuTargetPos])
}

function battleMenuTargetKill()
{
	kill(battleMenuTargetPos)
	kill(battleMenuTargetMax)
	kill(battleMenuTargetOptArmy)
	kill(battleMenuTargetOptUnit)
	killCanvas(battleMenuTargetCanvas)
	killCanvas(battleMenuTargetOptCanvas)
}

function battleMenuTargetSetUnit(intPosition,intUnit)
{
	battleMenuTargetOptUnit[intPosition] = intUnit
	kill(intPosition)
	kill(intUnit)
}

function battleMenuTargetWait()
{
	intResult = 0
	stringKey = wait()
	if(stringKey=="ENTER" || stringKey==" "){intResult = 2}
	if(stringKey=="ESC"){intResult = 3}
	if(stringKey=="UP")
	{
		if(battleMenuTargetPos>1)
		{
			battleMenuTargetPos = battleMenuTargetPos - 1
			intResult = 1
		}
	}
	if(stringKey=="DOWN")
	{
		if(battleMenuTargetPos<battleMenuTargetMax)
		{
			battleMenuTargetPos = battleMenuTargetPos + 1
			intResult = 1
		}
	}
	kill(stringKey)
	return(intResult)
}
