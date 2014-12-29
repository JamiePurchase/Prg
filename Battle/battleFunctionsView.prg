function battleView()
{
	battleViewInfo = 1
	battleViewMessage = 0
	battleViewDamage = 0
	battleViewStatus = 0
	battleViewSummon = 0
	battleViewLayer = 0
	for(ally=1;ally<=battleAllyCount;ally=ally+1)
	{
		battleViewUnitAnim[1][ally] = battleAllyAnimFileImage[ally]["Idle"]+1
		if(battleAllyStatus[ally]["KO"]==1)
		{
			battleViewUnitAnim[1][ally] = battleAllyAnimFileImage[ally]["Dead"]+1
		}
	}
	for(enemy=1;enemy<=battleEnemyCount;enemy=enemy+1)
	{
		battleViewUnitAnim[2][enemy] = battleEnemyAnimFileImage[enemy]["Idle"]+1
		if(battleAllyStatus[enemy]["KO"]==1)
		{
			battleViewUnitAnim[2][enemy] = battleEnemyAnimFileImage[enemy]["Dead"]+1
		}
	}
}

function battleViewBuild(frame)
{
	createCanvas(1366,768,battleView[frame])
	drawCanvas(battleBackgroundCanvas,0,0,1366,768,battleView[frame])
	if(battleViewInfo==1)
	{
		battleDrawInfo(battleView[frame])
	}
	if(battleViewMessage==1)
	{
		battleDrawMessage(battleView[frame])
	}
	if(battleViewDamage==1)
	{
		battleDrawDamage(battleView[frame])
	}
	if(battleViewStatus==1)
	{
		battleDrawStatus(battleView[frame])
	}
	battleDrawUnits(battleView[frame])
	if(battleViewSummon==1)
	{
		battleDrawSummon(battleView[frame])
	}
	if(battleViewLayer==1)
	{
		battleDrawLayerAnim(battleView[frame])
	}
}

function battleViewDamage()
{
	battleViewDamage = 1
}

function battleViewKill(frame)
{
	killCanvas(battleView[frame])
}

function battleViewLayerAnim(army,unit,image)
{
	battleViewLayer = 1
	battleViewLayerArmy = army
	battleViewLayerUnit = unit
	battleViewLayerImage = image
}

function battleViewMessage()
{
	battleViewMessage = 1
}

function battleViewRender(frame)
{
	drawCanvas(battleView[frame],0,0)
}

function battleViewStatus()
{
	battleViewStatus = 1
}

function battleViewSummon()
{
	battleViewSummon = 1
}




