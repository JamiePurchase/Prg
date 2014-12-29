include("extendArt.prg")

:Victory
victoryBuild()
branch(:VictoryDraw)

:VictoryDraw
victoryDraw()
branch(:VictoryWait)

:VictoryWait
wait()
branch(:VictoryDone)

:VictoryDone
victoryKill()

function victoryBuild()
{
	createCanvas(1366,768,victoryCanvas)
	artDrawAll(victoryCanvas)
	artDrawImageCentre("artTextVictory.png",50,350,200,victoryCanvas)

	artTextLeft("Gold","",100,200,victoryCanvas)
	stringGold = battleRewardGold + "g"
	artTextLeft(stringGold,"",300,200,victoryCanvas)

	// Temp
	artTextLeft("Experience","",100,250,victoryCanvas)
	for(ally=1;ally<=battleAllyCount;ally=ally+1)
	{
		stringY = 35 * ally + 250
		stringXP = battleRewardExps[ally] + "xp"
		artTextLeft(battleAllyInfoName[ally],"",110,stringY,victoryCanvas)
		artTextLeft(stringXP,"",300,stringY,victoryCanvas)
	}
}

function victoryDraw()
{
	drawCanvas(victoryCanvas,0,0)
	*victoryDrawGold(battleRewardGold)
	*victoryDrawExperience(battleRewardEXP)
}

function victoryDrawExperience(amount)
{
	artTextLeft("Experience","",100,350,victoryCanvas)
	artTextLeft(amount,"",200,350,victoryCanvas)
}

function victoryDrawGold(amount)
{
	createCanvas(1366,768,victoryCanvasGold)
	drawCanvas(victoryCanvas,0,0,1366,768,victoryCanvasGold)
	artTextLeft("Gold","",100,350,victoryCanvas)

	// Temp
	goldTotal = 500
	goldExtra = amount
	frameMax = goldExtra

	for(frame=1;frame<=frameMax;frame=frame+1)
	{
		createCanvas(1366,768,victoryCanvasGold[frame])
		goldTotalString = "G " + goldTotal
		goldExtraString = "+" + goldExtra
		artTextLeft(goldTotalString,"",125,385,victoryCanvasGold[frame])
		artTextLeft(goldExtraString,"",200,385,victoryCanvas[frame])
		goldTotal = goldTotal + 1
		goldExtra = goldExtra - 1
	}
	for(frame=1;frame<=frameMax;frame=frame+1)
	{
		drawCanvas(victoryCanvasGold[frame],0,0)
		delay(0.1)
	}
}

function victoryKill()
{
	killCanvas(victoryCanvas)
	killCanvas(victoryCanvasGold)
}

