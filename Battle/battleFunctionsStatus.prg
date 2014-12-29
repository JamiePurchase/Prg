function battleStatusCheckIdle(intArmy,intUnit)
{
	if(intArmy==1)
	{
		battleStatusCheckIdleAlly(intUnit)
	}
	if(intArmy==2)
	{
		battleStatusCheckIdleEnemy(intUnit)
	}
}

function battleStatusCheckIdleAlly(intUnit)
{
	if(battleAllyStatus[intUnit]["Poison"]==1)
	{
		damageBasic = battleAllyStatHPM[intUnit] / 10
		damageBonus = random(9)
		damageTotal = damageBasic + damageBonus
		battleView()
		battleViewUnitAnim[1][intUnit] = "allyPlayerPoison1"
		battleViewBuild(1)
		battleViewRender(1)
		delay(0.5)
		battleIdle()
	}
}

function battleStatusCheckIdleEnemy(intUnit)
{
}

