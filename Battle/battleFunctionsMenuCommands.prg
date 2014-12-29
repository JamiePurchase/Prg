include("extendDebug.prg")

function battleMenuCommands(intUnit)
{
	// Create Command Menu
	battleMenuCommandsPos = 1
	battleMenuCommandsMax = battleAllyMenuTechCount[intUnit]
	battleMenuCommandsOptUnit = intUnit
	battleMenuCommandsLeft = 0
	
	// Create Options
	for(intOpt=1;intOpt<=battleMenuCommandsMax;intOpt=intOpt+1)
	{
		strTech = battleAllyMenuTech[intUnit][intOpt]
		battleMenuCommandsOptTech[intOpt] = strTech
		battleMenuCommandsOptName[intOpt] = battleTechGetData(strTech,"MenuName")
		battleMenuCommandsOptType[intOpt] = battleTechGetData(strTech,"MenuType")
		battleMenuCommandsOptHelp[intOpt] = battleTechGetData(strTech,"MenuHelp")
		kill(strTech)
	}
	
	// Create Canvas
	battleMenuCommandsBuild()
	
	// Kill Variables
	kill(intUnit)
}

function battleMenuCommandsBuild()
{
	battleIdle()
	createCanvas(1366,768,battleMenuCommandsCanvas)
	canvasGetScreen(battleMenuCommandsCanvas)
	for(intPos=1;intPos<=battleMenuCommandsMax;intPos=intPos+1)
	{
		// Create Canvas
		createCanvas(1366,768,battleMenuCommandsOptCanvas[intPos])
		drawCanvas(battleMenuCommandsCanvas,0,0,1366,768,battleMenuCommandsOptCanvas[intPos])
		
		// Draw Options
		for(intOpt=1;intOpt<=battleMenuCommandsMax;intOpt=intOpt+1)
		{
			// Get Option Details
			strText = battleMenuCommandsOptName[intOpt]
			intPosX = 35
			intPosY = 35 * intOpt + 535
			
			// Draw Option Background
			artColour("OptionStandard")
			if(intOpt==intPos){artColour("OptionActive")}
			fillRect(intPosX,intPosY,intPosX+300,intPosY+35,battleMenuCommandsOptCanvas[intPos])
			
			// Draw Option Border
			artColour("OptionBorder")
			drawRect(intPosX,intPosY,intPosX+280,intPosY+1,battleMenuCommandsOptCanvas[intPos])
			drawRect(intPosX,intPosY+34,intPosX+280,intPosY+35,battleMenuCommandsOptCanvas[intPos])
			
			// Draw Option Text
			artTextCentre(strText,"BattleTextShadow",151,intPosY+1,battleMenuCommandsOptCanvas[intPos])
			artTextCentre(strText,"BattleTextShadow",152,intPosY+2,battleMenuCommandsOptCanvas[intPos])
			artTextCentre(strText,"BattleTextStandard",150,intPosY,battleMenuCommandsOptCanvas[intPos])
			
			// Kill Variables
			kill(strText)
			kill(intPosX)
			kill(intPosY)
		}
		
		// Draw Help Bar
		if(battleMenuCommandsOptHelp[intOpt]~="")
		{
			intView = gameOptionsGetOption("Battle","Help")
			if(intView==1)
			{
				strHelp = battleMenuCommandsOptHelp[intOpt]
				artColour("OptionStandard")
				fillRect(50,25,1316,90,battleMenuCommandsOptCanvas[intPos])
				artColour("OptionBorder")
				drawRect(50,25,1316,26,battleMenuCommandsOptCanvas[intPos])
				drawRect(50,89,1316,90,battleMenuCommandsOptCanvas[intPos])
				artTextLeft(strHelp,"BattleMessage",100,35,battleMenuCommandsOptCanvas[intPos])
				killl(strHelp)
			}
			kill(intView)
		}
		
		// Kill Variables
		kill(intOpt)
	}
	kill(intPos)
}

function battleMenuCommandsDraw()
{
	drawCanvas(battleMenuCommandsOptCanvas[battleMenuCommandsPos],0,0)
}

function battleMenuCommandsGetTechAtPos()
{
	return(battleMenuCommandsOptTech[battleMenuCommandsPos])
}

function battleMenuCommandsKill()
{
	kill(battleMenuCommandsPos)
	kill(battleMenuCommandsMax)
	kill(battleMenuCommandsOptUnit)
	kill(battleMenuCommandsOptName)
	kill(battleMenuCommandsOptTech)
	kill(battleMenuCommandsOptType)
	kill(battleMenuCommandsOptHelp)
	killCanvas(battleMenuCommandsCanvas)
	killCanvas(battleMenuCommandsOptCanvas)
}

function battleMenuCommandsSelect()
{
	// Get Tech Data
	strAction = battleMenuCommandsOptTech[battleMenuCommandsPos]
	strDamageType = battleTechGetData(strAction,"DamageType")
	intDamageBase = battleTechGetData(strAction,"DamageBase")
	strDamageDraw = battleTechGetData(strAction,"DamageDraw")
	strVisualImages = battleTechGetData(strAction,"AnimImages")
	intVisualFrames = battleTechGetData(strAction,"AnimFrames")

	// Create Action
	battleAction(strAction)
	battleActionSetSource(battleActiveArmy,battleActiveUnit)
	battleActionSetDamage(strDamageType,intDamageBase,strDamageDraw)
	battleActionSetVisual(strVisualImages,intVisualFrames)

	// Temp
	battleActionSetStatusCriticalChance(10)
	battleActionSetStatusGuardChance(20)
	battleActionSetStatusMissChance(10)
	battleActionSetStatusReflectChance(0)

	// Kill Variables
	kill(strAction)
	kill(strDamageType)
	kill(intDamageBase)
	kill(strDamageDraw)
	kill(strVisualImages)
	kill(intVisualFrames)
}

function battleMenuCommandsSetLeft(intValue)
{
	battleMenuCommandsLeft = intValue
	kill(intValue)
}

function battleMenuCommandsWait()
{
	intResult = 0
	strKey = wait()

	// Debug
	if(strKey=="d"){debugLogView()}

	if(strKey=="ENTER" || strKey==" "){intResult = 2}
	if(strKey=="RIGHT"){intResult = 3}
	if(strKey=="LEFT" && battleMenuCommandsLeft==1){intResult = 4}
	if(strKey=="UP")
	{
		if(battleMenuCommandsPos>1)
		{
			battleMenuCommandsPos = battleMenuCommandsPos - 1
			intResult = 1
		}
	}
	if(strKey=="DOWN")
	{
		if(battleMenuCommandsPos<battleMenuCommandsMax)
		{
			battleMenuCommandsPos = battleMenuCommandsPos + 1
			intResult = 1
		}
	}
	kill(strKey)
	return(intResult)
}


