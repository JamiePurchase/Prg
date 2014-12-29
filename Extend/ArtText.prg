function artTextStyle(textStyle)
{
	font("Segoe Print")
	fontSize(32)
	colorRGB(255,255,255)
	bold("off")
	italics("off")
	underline("off")

	if(textStyle=="BattleActionStatusBeneficial")
	{
		colorRGB(50,200,50)
		font("Trebuchet MS")
		fontSize(32)
		global(artTextSize) = 32
		bold("on")
		italics("on")
	}

	if(textStyle=="BattleActionStatusShadow")
	{
		colorRGB(0,0,0)
		font("Trebuchet MS")
		fontSize(32)
		global(artTextSize) = 32
		bold("on")
		italics("on")
	}

	if(textStyle=="BattleActionStatusStandard")
	{
		colorRGB(255,255,255)
		font("Trebuchet MS")
		fontSize(32)
		global(artTextSize) = 32
		bold("on")
		italics("on")
	}

	if(textStyle=="BattleActionText")
	{
		colorRGB(255,255,255)
		font("Trebuchet MS")
		fontSize(64)
		global(artTextSize) = 64
		bold("on")
	}

	if(textStyle=="BattleActionRestore")
	{
		colorRGB(0,150,0)
		font("Trebuchet MS")
		fontSize(64)
		global(artTextSize) = 64
		bold("on")
	}

	if(textStyle=="BattleDamageHeal")
	{
		colorRGB(50,200,50)
		font("Trebuchet MS")
		fontSize(48)
		global(artTextSize) = 48
		bold("on")
	}

	if(textStyle=="BattleDamageHeavy")
	{
		colorRGB(200,50,50)
		font("Trebuchet MS")
		fontSize(48)
		global(artTextSize) = 48
		bold("on")
	}

	if(textStyle=="BattleDamageShadow")
	{
		colorRGB(0,0,0)
		font("Trebuchet MS")
		fontSize(48)
		global(artTextSize) = 48
		bold("on")
	}

	if(textStyle=="BattleDamageStandard")
	{
		colorRGB(255,255,255)
		font("Trebuchet MS")
		fontSize(48)
		global(artTextSize) = 48
		bold("on")
	}

	if(textStyle=="BattleInfoHeader")
	{
		colorRGB(255,255,255)
		font("Times New Roman")
		fontSize(16)
		global(artTextSize) = 16
		underline("on")
	}

	if(textStyle=="BattleMenuCommand")
	{
		colorRGB(255,255,255)
		font("Segoe Print")
		fontSize(32)
		global(artTextSize) = 32
	}

	if(textStyle=="BattleMenuHeader")
	{
		colorRGB(255,255,255)
		font("Times New Roman")
		fontSize(16)
		global(artTextSize) = 16
		underline("on")
	}

	if(textStyle=="BattleMessage")
	{
		colorRGB(255,255,255)
		font("Segoe Print")
		fontSize(42)
		global(artTextSize) = 42
		bold("on")
	}

	if(textStyle=="BattleTextInfoEP")
	{
		colorRGB(255,100,255)
		font("Segoe Print")
		fontSize(32)
		global(artTextSize) = 32
	}

	if(textStyle=="BattleTextInfoHP")
	{
		colorRGB(100,255,100)
		font("Segoe Print")
		fontSize(32)
		global(artTextSize) = 32
	}

	if(textStyle=="BattleTextShadow")
	{
		colorRGB(0,0,0)
		font("Segoe Print")
		fontSize(32)
		global(artTextSize) = 32
	}

	if(textStyle=="BattleTextStandard")
	{
		colorRGB(255,255,255)
		font("Segoe Print")
		fontSize(32)
		global(artTextSize) = 32
	}

	if(textStyle=="DebugHeader")
	{
		colorRGB(0,255,0)
		font("Segoe Print")
		fontSize(64)
		global(artTextSize) = 64
		bold("on")
	}

	if(textStyle=="DebugText")
	{
		colorRGB(0,255,0)
		font("Trebuchet MS")
		fontSize(32)
		global(artTextSize) = 32
	}

	if(textStyle=="DebugTextUnderline")
	{
		colorRGB(0,255,0)
		font("Trebuchet MS")
		fontSize(32)
		global(artTextSize) = 32
	}

	if(textStyle=="MapPlaceName")
	{
		colorRGB(0,0,0)
		font("Segoe Print")
		fontSize(32)
		global(artTextSize) = 32
	}

	if(textStyle=="MessageTitle")
	{
		colorRGB(255,255,255)
		font("Segoe Print")
		fontSize(32)
		global(artTextSize) = 32
		bold("on")
	}

	if(textStyle=="MessageText")
	{
		colorRGB(255,255,255)
		font("Segoe Print")
		fontSize(32)
		global(artTextSize) = 32
	}

	if(textStyle=="TitleAuthor")
	{
		colorRGB(255,255,255)
		font("Segoe Print")
		fontSize(42)
		global(artTextSize) = 42
		italics("on")
	}

	if(textStyle=="TitleCursor")
	{
		colorRGB(255,255,255)
		font("Segoe Print")
		fontSize(42)
		global(artTextSize) = 32
	}

	if(textStyle=="TitleOption")
	{
		colorRGB(255,255,255)
		font("Segoe Print")
		fontSize(36)
		global(artTextSize) = 32
	}
}








