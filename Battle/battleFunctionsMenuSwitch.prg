function battleMenuSwitch(intUnit)
{
	// Create Switch Menu
	battleMenuSwitchPos = 1
	battleMenuSwitchMax = 0
	battleMenuSwitchUnit = intUnit

	// Create Options
	intMax = battleAllyCount - 3
	for(intPosition=1;intPosition<=intMax;intPosition=intPosition+1)
	{
		intParty = intPosition + 3
		battleMenuSwitchOption[intPosition] = battlePartyCharacter[intParty]
	}

	// Create Canvas
	battleMenuSwitchBuild()

	// Kill Variables
	kill(intUnit)
	kill(intMax)
	kill(intPosition)
	kill(intParty)
}

function battleMenuSwitchBuild()
{
	battleIdle()
	createCanvas(1366,768,battleMenuSwitchCanvas)
	canvasGetScreen(battleMenuSwitchCanvas)
	for(intPosition=1;intPosition<=battleMenuSwitchMax;intPosition=intPosition+1)
	{
		// Create Canvas
		createCanvas(1366,768,battleMenuSwitchOptionCanvas[intPosition])
		drawCanvas(battleMenuSwitchCanvas,0,0,1366,768,battleMenuSwitchOptionCanvas[intPosition])

		// Draw Options
		for(intUnit=1;intUnit<=battleMenuSwitchMax;intUnit=intUnit+1)
		{
			// Get Unit Details
			intUnitId = battleMenuSwitchGetUnit(intPosition)
			if(battleMenuSwitchOptArmy==1){stringText = battleAllyInfoName[intUnitId]}
			if(battleMenuSwitchOptArmy==2){stringText = battleEnemyInfoName[intUnitId]}

			// Get Position
			intPosX = 35
			intPosY = 35 * intUnit + 535

			// Drw Option Background
			artColour("OptionStandard")
			if(intPosition==intUnit){artColour("OptionActive")}
			fillRect(intPosX,intPosY,intPosX+280,intPosY+35,battleMenuSwitchOptionCanvas[intPosition])

			// Draw Option Border
			artColour("OptionBorder")
			drawRect(intPosX,intPosY,intPosX+280,intPosY+1,battleMenuSwitchOptionCanvas[intPosition])
			drawRect(intPosX,intPosY+34,intPosX+280,intPosY+35,battleMenuSwitchOptionCanvas[intPosition])

			// Draw Option Text
			artTextCentre(stringText,"BattleTextShadow",151,intPosY+1,battleMenuSwitchOptionCanvas[intPosition])
			artTextCentre(stringText,"BattleTextShadow",152,intPosY+2,battleMenuSwitchOptionCanvas[intPosition])
			artTextCentre(stringText,"BattleTextStandard",150,intPosY,battleMenuSwitchOptionCanvas[intPosition])

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

function battleMenuSwitchDraw()
{
	drawCanvas(battleMenuSwitchOptionCanvas[battleMenuSwitchPos],0,0)
}

function battleMenuSwitchGetUnit(intPosition)
{
	intUnit = battleMenuSwitchOption[intPosition]
	kill(intPosition)
	return(intUnit)
}

function battleMenuSwitchGetUnitAtPos()
{
	return(battleMenuSwitchOption[battleMenuSwitchPos])
}

function battleMenuSwitchKill()
{
	kill(battleMenuSwitchPos)
	kill(battleMenuSwitchMax)
	kill(battleMenuSwitchUnit)
	kill(battleMenuSwitchOption)
	killCanvas(battleMenuSwitchCanvas)
	killCanvas(battleMenuSwitchOptionCanvas)
}

function battleMenuSwitchWait()
{
	intResult = 0
	stringKey = wait()
	if(stringKey=="ENTER" || stringKey==" "){intResult = 2}
	if(stringKey=="ESC"){intResult = 3}
	if(stringKey=="UP")
	{
		if(battleMenuSwitchPos>1)
		{
			battleMenuSwitchPos = battleMenuSwitchPos - 1
			intResult = 1
		}
	}
	if(stringKey=="DOWN")
	{
		if(battleMenuSwitchPos<battleMenuSwitchMax)
		{
			battleMenuSwitchPos = battleMenuSwitchPos + 1
			intResult = 1
		}
	}
	kill(stringKey)
	return(intResult)
}
