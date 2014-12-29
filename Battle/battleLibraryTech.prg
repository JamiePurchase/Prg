function battleTechGetData(strTech,strElement)
{
	// Default Data
	varData["MenuName"] = ""
	varData["MenuType"] = ""
	varData["MenuHelp"] = ""
	varData["AnimImages"] = ""
	varData["AnimFrames"] = 0
	varData["DamageType"] = ""
	varData["DamageBase"] = 0
	varData["DamageDraw"] = ""
	
	// Get Data
	if(strTech=="AttackKlaus")
	{
		varData["MenuName"] = "Attack"
		varData["MenuType"] = "Attack"
		varData["MenuHelp"] = "Attacks the target with the spear"
		varData["AnimImages"] = "allyKlausAtkA"
		varData["AnimFrames"] = 8
		varData["DamageType"] = "Melee"
		varData["DamageBase"] = 24
		varData["DamageDraw"] = "Standard"
	}
	if(strTech=="AttackManton")
	{
		varData["MenuName"] = "Attack"
		varData["MenuType"] = "Attack"
		varData["MenuHelp"] = "Attacks the target with the magic in the staff"
		varData["AnimImages"] = "allyMantonAtkA"
		varData["AnimFrames"] = 8
		varData["DamageType"] = "Melee"
		varData["DamageBase"] = 24
		varData["DamageDraw"] = "Standard"
	}
	if(strTech=="AttackPlayer")
	{
		varData["MenuName"] = "Attack"
		varData["MenuType"] = "Attack"
		varData["MenuHelp"] = "Strikes the target with the daggers"
		varData["AnimImages"] = "allyPlayerAtkA"
		varData["AnimFrames"] = 8
		varData["DamageType"] = "Melee"
		varData["DamageBase"] = 24
		varData["DamageDraw"] = "Standard"
	}
	if(strTech=="AttackYoshi")
	{
		varData["MenuName"] = "Attack"
		varData["MenuType"] = "Attack"
		varData["MenuHelp"] = "Shoots the target with the bow and arrows"
		varData["AnimImages"] = "allyYoshiAtkA"
		varData["AnimFrames"] = 12
		varData["DamageType"] = "Melee"
		varData["DamageBase"] = 24
		varData["DamageDraw"] = "Standard"
	}
	if(strTech=="Items")
	{
		varData["MenuName"] = "Items"
		varData["MenuType"] = "Items"
	}
	if(strTech=="SpcJump")
	{
		varData["MenuName"] = "Jump"
		varData["MenuType"] = "Spc"
		varData["MenuHelp"] = "Jumps into the air to prepare for a devastating attack"
	}
	if(strTech=="SubSkills")
	{
		varData["MenuName"] = "Skills"
		varData["MenuType"] = "Sub"
	}
	if(strTech=="SubSpells")
	{
		varData["MenuName"] = "Spells"
		varData["MenuType"] = "Sub"
	}
	
	// Return Data
	kill(strTech)
	return(varData[strElement])
}
