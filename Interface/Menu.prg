include("Extend/Draw.prg")

:Menu
menuRef("Main")
branch(:MenuBuild)

:MenuBuild
menuBuild()
branch(:MenuDraw)

:MenuDraw
menuDraw()
branch(:MenuWait)

:MenuWait
intResult = menuWait()
if(intResult==1){branch(:MenuDraw)}
if(intResult==2){branch(:MenuSelect)}
if(intResult==3){branch(:MenuDone)}
branch(:MenuWait)

:MenuSelect
if(menuPos==11){branch(:MenuDone)}
if(menuPos==1){menuRef("Missions")}
if(menuPos==2){menuRef("Inventory")}
branch(:MenuBuild)

:MenuDone
menuKill()

// FUNCTIONS

function menuBuild()
{
	createCanvas(1366,768,menuCanvas)
	if(menuRef=="Main")
	{
		if(menuCanvasSave<1){menuBuildMain()}
		else{drawCanvas(menuCanvasSave,0,0,1366,768,menuCanvas)}
	}
	if(menuRef=="Inventory"){menuBuildInventory()}
}

function menuBuildInventory()
{
	drawAll(239,228,176,menuCanvas)
	menuBuildInventoryOptions()
}

function menuBuildInventoryOptions()
{

}

function menuBuildMain()
{
	drawAll(239,228,176,menuCanvas)
	menuBuildMainOptions()
	menuBuildInfoLocation()
	menuBuildInfoWealth()
	menuBuildParty()
	menuCanvasSave()
}

function menuBuildInfoLocation()
{
	strLocation = "Location: "
	drawFrame(25,690,1050,743,"",menuCanvas)
	drawTextLeft(strLocation,"FrameText",50,695,menuCanvas)
	kill(strLocation)
}

function menuBuildInfoWealth()
{
	strWealth = "5000 g"
	drawFrame(1065,690,1341,743,"",menuCanvas)
	drawTextRight(strWealth,"FrameText",1316,695,menuCanvas)
}

function menuBuildMainOptions()
{
	menuOption[1] = "Quests"
	menuOption[2] = "Inventory"
	menuOption[3] = "Equipment"
	menuOption[4] = "Abilities"
	menuOption[5] = "Fury"
	menuOption[6] = "Status"
	menuOption[7] = "Spirits"
	menuOption[8] = "Formation"
	menuOption[9] = "Journal"
	menuOption[10] = "Options"
	menuOption[11] = "Done"
	for(intOpt=1;intOpt<=menuMax;intOpt=intOpt+1)
	{
		intPosY = 60 * intOpt - 35
		drawFrame(25,intPosY,250,intPosY+50,"MenuOption",menuCanvas)
		drawTextLeft(menuOption[intOpt],"MenuOption",50,intPosY+5,menuCanvas)
	}
	kill(intOpt)
	kill(intPosY)
}

function menuBuildParty()
{
	// Temp (this value should be taken from the party object - remove intCharMax)
	intCharMax = 7
	//
	for(intChar=1;intChar<=intCharMax;intChar=intChar+1)
	{
		// NOTE: There should be a list of slots in the party, which contain the ID of the character in that slot
		// You cannot assume that player1 will always be in position 1
		intPosX = 275
		intPosY = 94 * intChar - 69
		menuBuildPartyCharacter(intChar,intPosX,intPosY,menuCanvas)
	}
	kill(intChar)
	kill(intPosX)
	kill(intPosY)	
}

function menuBuildPartyCharacter(intChar,intPosX,intPosY,cnvDraw)
{
	// Data
	strHP1 = "120"
	strHP2 = "/120"
	strMP1 = "85"
	strMP2 = "/85"
	strLV = "1"
	strXP1 = "257"
	strXP2 = "/350"
	strFP = "35%"
	strFR = "Rank 1"
	
	// Frame
	drawFrame(intPosX,intPosY,intPosX+1066,intPosY+84,"",cnvDraw)
	
	// Name
	drawTextLeft("Character","MenuCharacterName",intPosX+25,intPosY+5,cnvDraw)
	
	// HP
	drawTextLeft("HP","MenuCharacterStatLabel",intPosX+425,intPosY+5,cnvDraw)
	drawTextRight(strHP1,"MenuCharacterStatValue",intPosX+565,intPosY+5,cnvDraw)
	drawTextLeft(strHP2,"MenuCharacterStatValue",intPosX+570,intPosY+5,cnvDraw)
	
	// MP
	drawTextLeft("MP","MenuCharacterStatLabel",intPosX+425,intPosY+45,cnvDraw)
	drawTextRight(strMP1,"MenuCharacterStatValue",intPosX+565,intPosY+45,cnvDraw)
	drawTextLeft(strMP2,"MenuCharacterStatValue",intPosX+570,intPosY+45,cnvDraw)
	
	// LV and EXP
	drawTextLeft("LV","MenuCharacterStatLabel",intPosX+725,intPosY+5,cnvDraw)
	drawTextLeft(strLV,"MenuCharacterStatLevel",intPosX+765,intPosY,cnvDraw)
	drawTextRight(strXP1,"MenuCharacterStatValue",intPosX+900,intPosY+5,cnvDraw)
	drawTextLeft(strXP2,"MenuCharacterStatValue",intPosX+905,intPosY+5,cnvDraw)
	
	// Fury
	drawTextLeft("Fury","MenuCharacterStatLabel",intPosX+725,intPosY+45,cnvDraw)
	drawTextRight(strFP,"MenuCharacterStatValue",intPosX+885,intPosY+45,cnvDraw)
	drawTextLeft(strFR,"MenuCharacterStatValue",intPosX+915,intPosY+45,cnvDraw)

	// Kill Variables
	kill(intChar)
	kill(intPosX)
	kill(intPosY)
	kill(cnvDraw)
	kill(strHP1)
	kill(strHP2)
	kill(strMP1)
	kill(strMP2)
	kill(strLV)
	kill(strXP1)
	kill(strXP2)
	kill(strFP)
	kill(strFR)
}

function menuCanvasSave()
{
	createCanvas(1366,768,menuCanvasSave)
	drawCanvas(menuCanvas,0,0,1366,768,menuCanvasSave)
	menuCanvasSave = 1
}

function menuCanvasKill()
{
	kill(menuCanvasSave)
	killCanvas(menuCanvasSave)
}

function menuDraw()
{
	drawCanvas(menuCanvas,0,0)
	menuDrawCursor()
}

function menuDrawCursor()
{
	intPosY = 60 * menuPos - 35
	drawFrame(25,intPosY,250,intPosY+50,"MenuOptionHover")
	drawTextLeft(menuOption[menuPos],"MenuOptionHover",50,intPosY+5)
	kill(intPosY)
}

function menuKill()
{
	kill(menuPos)
	kill(menuMax)
	killCanvas(menuCanvas)
	killCanvas(menuCanvasSave)
}

function menuRef(strRef)
{
	if(strRef=="Main")
	{
		menuRef = "Main"
		menuPos = 1
		menuMax = 11
	}
	if(strRef=="Missions")
	{
		menuRef = "Missions"
		menuPos = 0
		menuMax = 0
	}
	kill(strRef)
}

function menuWait()
{
	intResult = 0
	strKey = wait()
	if(strKey==" "){intResult = 2}
	if(strKey=="ESC"){intResult = 3}
	if(strKey=="UP" && menuPos>1)
	{
		menuPos = menuPos - 1
		intResult = 1
	}
	if(strKey=="DOWN" && menuPos<menuMax)
	{
		menuPos = menuPos + 1
		intResult = 1
	}
	kill(strKey)
	return(intResult)
}




