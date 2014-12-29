include("Extend/Art.prg")

function battleDrawDamage(cnvDraw)
{
	strWrite = battleActionDamageTotal
	strStyle = "BattleDamageStandard"
	if(battleActionDamageDraw=="Heavy"){strStyle = "BattleDamageHeavy"}
	if(battleActionDamageDraw=="Heal"){strStyle = "BattleDamageHeal"}
	if(battleActionTargetArmy==1)
	{
		intPosX = battleAllyAnimPosX[battleActionTargetUnit] + 50
		intPosY = battleAllyAnimPosY[battleActionTargetUnit] - 35 - tempDamageOffset
	}
	if(battleActionTargetArmy==2)
	{
		intHalf = battleEnemyAnimWide[battleActionTargetUnit] / 2
		intPosX = battleEnemyAnimPosX[battleActionTargetUnit] + intHalf
		intPosY = battleEnemyAnimPosY[battleActionTargetUnit] - 35 - tempDamageOffset
		kill(intHalf)
	}
	drawTextCenter(strWrite,"BattleDamageShadow",intPosX+1,intPosY+1,cnvDraw)
	drawTextCenter(strWrite,"BattleDamageShadow",intPosX+2,intPosY+2,cnvDraw)
	drawTextCenter(strWrite,strStyle,intPosX,intPosY,cnvDraw)
	kill(cnvDraw)
	kill(strWrite)
	kill(strStyle)
	kill(intPosX)
	kill(intPosY)
}

function battleDrawInfo(cnvDraw)
{
	createCanvas(1366,768,cnvInfo)
	artColour("Transparent")
	fillRect(0,0,1366,768,cnvInfo)
	if(battleAllyCount>3)
	{
		intMax = 3
	}
	else
	{
		intMax = battleAllyCount
	}
	for(intForm=1;intForm<=intMax;intForm=intForm+1)
	{
		intUnit = battlePartyFormAlly[intForm]
		battleDrawInfoAlly(intUnit,cnvInfo)
	}
	drawCanvasTransparent(cnvInfo,0,0,0,255,0,1366,768,cnvDraw)
	kill(cnvDraw)
	kill(intMax)
	kill(intForm)
	kill(intUnit)
	killCanvas(cnvInfo)
}

function battleDrawInfoAlly(ally,canvas)
{
	// Name
	infoText[1] = battleAllyInfoName[ally]
	infoType[1] = "BattleTextStandard"
	infoPosX[1] = 900
	infoPosY[1] = 60 * ally + 500

	// HP Label
	infoText[2] = "HP"
	infoType[2] = "BattleTextInfoHP"
	infoPosX[2] = 1025
	infoPosY[2] = 60 * ally + 500

	// HP Value
	infoText[3] = battleAllyStatHPC[ally]
	infoType[3] = "BattleTextStandard"
	infoPosX[3] = 1075
	infoPosY[3] = 60 * ally + 500

	// EP Label
	infoText[4] = "MP"
	infoType[4] = "BattleTextInfoEP"
	infoPosX[4] = 1175
	infoPosY[4] = 60 * ally + 500

	// EP Value
	infoText[5] = battleAllyStatEPC[ally]
	infoType[5] = "BattleTextStandard"
	infoPosX[5] = 1225
	infoPosY[5] = 60 * ally + 500

	// Highlight
	if(battleDrawInfoHighlight==ally)
	{
		artColour("OptionActive")
		fillRect(875,infoPosY[1]-5,1310,infoPosY[1]+50,canvas)
	}

	// Draw Text
	for(x=1;x<=5;x=x+1)
	{
		drawTextLeft(infoText[x],"BattleTextShadow",infoPosX[x]+1,infoPosY[x]+1,canvas)
		drawTextLeft(infoText[x],"BattleTextShadow",infoPosX[x]+2,infoPosY[x]+2,canvas)
		drawTextLeft(infoText[x],infoType[x],infoPosX[x],infoPosY[x],canvas)
	}

	// Fury Bar
	furyPosX[1] = 910
	furyPosY[1] = 60 * ally + 530
	furyPosX[2] = 1290
	furyPosY[2] = 60 * ally + 545
	* Temp
	furyPosX[3] = furyPosX[1] + 300
	*
	colorRGB(0,0,0)
	fillRect(furyPosX[1],furyPosY[1],furyPosX[2],furyPosY[2],canvas)
	artColour("BattleFuryStandard")
	if(battleAllyFuryStat[ally]==100){artColour("BattleFuryActive")}
	fillRect(furyPosX[1]+1,furyPosY[1]+1,furyPosX[3],furyPosY[2]-1,canvas)

	// Kill Variables
	kill(infoText)
	kill(infoType)
	kill(infoPosX)
	kill(infoPosY)
	kill(furyPosX)
	kill(furyPosY)
}

function battleDrawLayerAnim(cnvDraw)
{
	strFile = battleViewLayerImage
	if(battleViewLayerArmy==1)
	{
		imagePosX = battleAllyAnimPosX[battleViewLayerUnit]
		imagePosY = battleAllyAnimPosY[battleViewLayerUnit]
	}
	if(battleViewLayerArmy==2)
	{
		imagePosX = battleEnemyAnimPosX[battleViewLayerUnit]
		imagePosY = battleEnemyAnimPosY[battleViewLayerUnit]
	}
	intWide = 100
	intHigh = 100
	createCanvas(intWide,intHigh,cnvLayer)
	artColour("Transparent")
	fillRect(0,0,imageWide,imageHigh,cnvLayer)
	setImage(strFile,0,0,imageWide,imageHigh,cnvLayer)
	drawCanvasTransparent(cnvLayer,intPosX,intPosY,0,255,0,intWide,intHigh,cnvDraw)
	kill(cnvDraw)
	kill(strFile)
	kill(intPosX)
	kill(intPosY)
	kill(intWide)
	kill(intHigh)
	killCanvas(cnvLayer)
}

function battleDrawMessage(cnvDraw)
{
	createCanvas(1366,100,cnvMessage)
	artColour("Transparent")
	fillRect(0,0,1366,100,cnvMessage)

	// Message Frame
	artColour("OptionStandard")
	fillRect(50,25,1316,90,cnvMessage)
	artColour("OptionBorder")
	drawRect(50,25,1316,26,cnvMessage)
	drawRect(50,89,1316,90,cnvMessage)

	// Message String
	messageString = battleActionRenderName
	drawTextLeft(messageString,"BattleMessage",100,35,cnvMessage)

	// Draw Canvas
	drawCanvasTransparent(cnvMessage,0,0,0,255,0,1366,100,cnvDraw)

	// Kill Variables
	kill(cnvDraw)
	killCanvas(cnvMessage)
}

function battleDrawStatus(cnvDraw)
{
	textString = battleStatusGetDisplayString(battleActionStatusEffect)
	textStyle = battleStatusGetDisplayStyle(battleActionStatusEffect)
	if(battleActionTargetArmy==1)
	{
		textX = battleAllyAnimPosX[battleActionTargetUnit] + 50
		textY = battleAllyAnimPosY[battleActionTargetUnit] - 35
	}
	if(battleActionTargetArmy==2)
	{
		halfX = battleEnemyAnimWide[battleActionTargetUnit] / 2
		textX = battleEnemyAnimPosX[battleActionTargetUnit] + halfX
		textY = battleEnemyAnimPosY[battleActionTargetUnit] - 35
	}
	drawTextCenter(textString,"BattleActionStatusShadow",textX+1,textY+1,cnvDraw)
	drawTextCenter(textString,"BattleActionStatusShadow",textX+2,textY+2,cnvDraw)
	drawTextCenter(textString,textStyle,textX,textY,cnvDraw)
	kill(cnvDraw)
}

function battleDrawSummon(cnvDraw)
{
	strFile = "Battle\"+battleViewSummonAnim+".png"
	setImageTransparent(strFile,550,250,250,250,0,255,0,cnvDraw)
	kill(cnvDraw)
	kill(strFile)
}

function battleDrawUnits(cnvUnits)
{
	battleDrawUnitsAllies(cnvUnits)
	battleDrawUnitsEnemies(cnvUnits)
	kill(cnvUnits)
}

function battleDrawUnitsAllies(cnvDraw)
{
	if(battleAllyCount>3)
	{
		intMax = 3
	}
	else
	{
		intMax = battleAllyCount
	}
	for(intForm=1;intForm<=intMax;intForm=intForm+1)
	{
		intAlly = battlePartyFormAlly[intForm]
		strFile = "Battle\"+battleViewUnitAnim[1][intAlly]+".png"
		intPosX = battleAllyAnimPosX[intAlly]
		intPosY = battleAllyAnimPosY[intAlly]
		setImageTransparent(strFile,intPosX,intPosY,100,100,0,255,0,cnvDraw)
	}
	kill(intForm)
	kill(intAlly)
	kill(intMax)
	kill(strFile)
	kill(intPosX)
	kill(intPosY)
	kill(cnvDraw)
}

function battleDrawUnitsEnemies(cnvDraw)
{
	for(intEnemy=1;intEnemy<=battleEnemyCount;intEnemy=intEnemy+1)
	{
		strFile = "Battle\"+battleViewUnitAnim[2][intEnemy]+".png"
		intPosX = battleEnemyAnimPosX[intEnemy]
		intPosY = battleEnemyAnimPosY[intEnemy]
		intWide = battleEnemyAnimWide[intEnemy]
		intHigh = battleEnemyAnimHigh[intEnemy]
		setImageTransparent(strFile,intPosX,intPosY,intWide,intHigh,0,255,0,cnvDraw)
	}
	kill(intEnemy)
	kill(strFile)
	kill(intPosX)
	kill(intPosY)
	kill(intWide)
	kill(intHigh)
	kill(cnvDraw)
}
