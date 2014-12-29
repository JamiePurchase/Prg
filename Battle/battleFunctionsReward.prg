function battleGetReward()
{
	battleGetRewardExps()
	battleGetRewardGold()
	battleGetRewardItem()
}

function battleGetRewardExps()
{
	xp = battleGetRewardExpsTotal()
	for(ally=1;ally<=battleAllyCount;ally=ally+1)
	{
		battleRewardExps[ally] = battleGetRewardExpsUnit(ally,xp)
	}
}

function battleGetRewardExpsTotal()
{
	xp = 0
	for(enemy=1;enemy<=battleEnemyCount;enemy=enemy+1)
	{
		xp = xp + battleEnemyLootExps[enemy]
	}
	return(xp)
}

function battleGetRewardExpsUnit(ally,xp)
{
	xp = xp * battleAllyLootExps[ally]
	return(xp)
}

function battleGetRewardGold()
{
	gold = battleGetRewardGoldTotal()
	for(ally=1;ally<=battleAllyCount;ally=ally+1)
	{
		battleRewardGold[ally] = battleGetRewardGoldUnit(ally,gold)
	}
}

function battleGetRewardGoldTotal()
{
	gold = 0
	for(enemy=1;enemy<=battleEnemyCount;enemy=enemy+1)
	{
		range = battleEnemyLootGoldMax[enemy] - battleEnemyLootGoldMin[enemy]
		result = random(range)
		amount = result + battleEnemyLootGoldMin[enemy]
		gold = gold + amount
	}
	return(gold)
}

function battleGetRewardGoldUnit(ally,gold)
{
	gold = gold * battleAllyLootGold[ally]
	return(gold)
}

function battleGetRewardItem()
{
	battleRewardItemCount = 0
	battleGetRewardItemTotal()
}

function battleGetRewardItemChance()
{
	chance = 1
	for(ally=1;ally<=battleAllyCount;ally=ally+1)
	{
		chance = chance * battleAllyLootItem[ally]
	}
	return(chance)
}

function battleGetRewardItemEnemy(enemy,chance)
{
	result = 0
	if(battleEnemyLootItem[enemy]!=0)
	{
		// If the enemy might drop an item
		// Do a random calculation to determine if it is dropped
		// Use the chance argument to improve the chance
		// Alter the result variable to return the itemID
	}
	return(result)
}

function battleGetRewardItemTotal()
{
	chance = battleGetRewardItemChance()
	for(enemy=1;enemy<=battleEnemyCount;enemy=enemy+1)
	{
		result = battleGetRewardItemEnemy(enemy,chance)
		if(result!=0)
		{
			item = battleRewardItemCount + 1
			battleRewardItemID[item] = result
			battleRewardItemCount = battleRewardItemCount + 1
		}
	}
}
