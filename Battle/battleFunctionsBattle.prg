function battle(strType,strBackground)
{
	// Create Battle
	battleBackground = "Battle/Background/" + strBackground + ".png"
	battleClock = 0
	battleType = strType

	// Build Battle
	battleBuild()

	// Kill Variables
	kill(strBackground)
	kill(strType)
}

function battleAdvance()
{
	battleClock = battleClock + 1
	battleAdvanceAllies()
	battleAdvanceEnemies()
}

function battleAdvanceAllies()
{
	for(intAlly=1;intAlly<=battleAllyCount;intAlly=intAlly+1)
	{
		battleAllyTimeWait[intAlly] = battleAllyTimeWait[intAlly] - 1
	}
	kill(intAlly)
}

function battleAdvanceEnemies()
{
	for(intEnemy=1;intEnemy<=battleEnemyCount;intEnemy=intEnemy+1)
	{
		battleEnemyTimeWait[intEnemy] = battleEnemyTimeWait[intEnemy] - 1
	}
	kill(intEnemy)
}

function battleBuild()
{
	createCanvas(1366,768,battleBackgroundCanvas)
	setImage(battleBackground,0,0,1366,768,battleBackgroundCanvas)
}

function battleCheckAllies()
{
	intResult = 0
	for(intAlly=1;intAlly<=battleAllyCount;intAlly=intAlly+1)
	{
		if(battleAllyStatHPC[intAlly]>0 && battleAllyStatus[intAlly]["KO"]<1)
		{
			intResult = intResult + 1
		}
	}
	kill(intAlly)
	return(intResult)
}

function battleCheckEnemies()
{
	intResult = 0
	for(intEnemy=1;intEnemy<=battleEnemyCount;intEnemy=intEnemy+1)
	{
		if(battleEnemyStatHPC[intEnemy]>0 && battleEnemyStatus[intEnemy]["KO"]<1)
		{
			intResult = intResult + 1
		}
	}
	kill(intEnemy)
	return(intResult)
}

function battleDefeat()
{
	artDrawAll()
	artDrawImageCentre("artTextGameOver.png",50,600,200)
	wait()
	* note: try battle again? load autosave? back to title?
	windows()
}

function battleGetBackground()
{
	return(battleBackground)
}

function battleGetClock()
{
	return(battleClock)
}

function battleGetReadyAllies()
{
	intResult = 0
	for(intAlly=1;intAlly<=battleAllyCount;intAlly=intAlly+1)
	{
		if(battleAllyTimeWait[intAlly]<1 && battleAllyStatus[intAlly]["KO"]==0)
		{
			return(intAlly)
		}
	}
	return(intResult)
}

function battleGetReadyEnemies()
{
	intResult = 0
	for(intEnemy=1;intEnemy<=battleEnemyCount;intEnemy=intEnemy+1)
	{
		if(battleEnemyTimeWait[intEnemy]<1 && battleEnemyStatus[intEnemy]["KO"]==0)
		{
			return(intEnemy)
		}
	}
	return(intResult)
}

* note: this should be reconsidered (partially belongs to the current battleFunctionsView program)
function battleIdle()
{
	battleView()
	battleViewBuild(1)
	battleViewRender(1)
	battleDebugDrawInfo()
}

function battleKill()
{
	kill(battleBackground)
	kill(battleClock)
}



