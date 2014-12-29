function battleStatusGetDisplayString(status)
{
	string = ""
	if(status=="Bleed"){string="BLEEDING"}
	if(status=="Poison"){string="POISON"}
	if(status=="RegenHP"){string="REGENERATION"}
	return(string)
}

function battleStatusGetDisplayStyle(status)
{
	style = ""
	if(status=="Bleed"){style="BattleActionStatusStandard"}
	if(status=="Poison"){style="BattleActionStatusStandard"}
	if(status=="RegenHP"){style="BattleActionStatusBeneficial"}
	return(style)
}

