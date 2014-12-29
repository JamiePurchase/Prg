function battleParty()
{
	// Create Party
	battleAllyCount = partyCount

	// Create Units
	for(intAlly=1;intAlly<=battleAllyCount;intAlly=intAlly+1)
	{
		battlePartySetUnit(intAlly,intAlly,intAlly)
	}
}

function battlePartyFormSwitch(intSourceUnit,intTargetUnit)
{
	// Get Form Location
	intSourceForm = battleAllyInfoForm[intSourceUnit]
	intTargetForm = battleAllyInfoForm[intTargetUnit]

	// Update Party
	battlePartyFormAlly[intSourceForm] = intTargetUnit
	battlePartyFormAlly[intTargetForm] = intSourceUnit

	// Update Allies
	battleAllyInfoForm[intSourceUnit] = intTargetForm
	battleAllyInfoForm[intTargetUnit] = intSourceForm

	// Kill Variables
	kill(intSourceForm)
	kill(intTargetForm)
	kill(intSourcePos)
	kill(intTargetPos)
}

function battlePartyKill()
{
	kill(battleAllyCount)
}

function battlePartySetUnit(intAlly,intUnit,intForm)
{
	// Party Formation
	battlePartyFormAlly[intForm] = intUnit

	// Information
	battleAllyInfoName[intUnit] = characterInfoName[intAlly]
	battleAllyInfoType[intUnit] = characterInfoType[intAlly]
	battleAllyInfoForm[intUnit] = intForm

	// Statistics
	battleAllyStatHPC[intUnit] = characterStatHPC[intAlly]
	battleAllyStatHPM[intUnit] = characterStatHPM[intAlly]
	battleAllyStatEPC[intUnit] = characterStatEPC[intAlly]
	battleAllyStatEPM[intUnit] = characterStatEPM[intAlly]

	// Status Effects
	battleAllyStatus[intUnit]["KO"] = 0

	// Timing
	battleAllyTimeWait[intUnit] = 5
	* the TimeWait stat is the percentage ready to act - this could be randomised / based on who is quickest?

	// Battle Techniques
	battleAllyMenuTechCount[intUnit] = characterMenuTechCount[intAlly]
	for(intTech=1;intTech<=battleAllyMenuTechCount[intUnit];intTech=intTech+1)
	{
		battleAllyMenuTech[intUnit][intTech] = characterMenuTech[intAlly][intTech]
	}

	// Fury Technique
	battleAllyFuryStat[intUnit] = characterFuryStat[intAlly]
	battleAllyFuryType[intUnit] = characterFuryType[intAlly]
	battleAllyFuryTech[intUnit] = characterFuryTech[intAlly]

	// Animation: Actions
	battleAllyAnimFileImage[intUnit]["Idle"] = characterAnimImage[intAlly]["Idle"]
	battleAllyAnimFileCount[intUnit]["Idle"] = characterAnimCount[intAlly]["Idle"]
	battleAllyAnimFileImage[intUnit]["ATK1"] = characterAnimImage[intAlly]["ATK1"]
	battleAllyAnimFileCount[intUnit]["ATK1"] = characterAnimCount[intAlly]["ATK1"]

	// Animation: Position
	battleAllyAnimPosX[intUnit] = 1200
	if(battleAllyFormRow[intUnit]=="back"){battleAllyAnimPosX[intUnit] = 1300}
	if(intForm<=3){battleAllyAnimPosY[intUnit] = 100 * intForm + 100}
	else{battleAllyAnimPosY[intUnit] = 0}

	// Reward Chance Modifiers
	battleAllyLootExps[intUnit] = characterLootExps[intAlly]
	battleAllyLootGold[intUnit] = characterLootGold[intAlly]
	battleAllyLootItem[intUnit] = characterLootItem[intAlly]

	// Kill Variables
	kill(intAlly)
	kill(intUnit)
	kill(intForm)
	kill(intTech)
}


