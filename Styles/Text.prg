function styleText(strStyle)
{
	// Defaults
	styleTextFont = "Segoe Print"
	styleTextColourR = 255
	styleTextColourG = 255
	styleTextColourB = 255
	styleTextSize = 32
	styleTextBold = 0
	styleTextItalics = 0
	styleTextUnderline = 0
	styleTextShadow = 0
	styleTextShadowR = 0
	styleTextShadowG = 0
	styleTextShadowB = 0

	// Standard
	if(strStyle=="Standard")
	{
		styleTextFont = "Segoe Script"
		styleTextSize = 32
		styleTextColourR = 0
		styleTextColourG = 0
		styleTextColourB = 0
	}

	// Styles
	if(strStyle=="FrameText")
	{
		styleTextFont = "Segoe Print"
		styleTextSize = 46
		styleTextColourR = 110
		styleTextColourG = 90
		styleTextColourB = 52
	}
	if(strStyle=="MenuCharacterName")
	{
		styleTextFont = "Segoe Script"
		styleTextSize = 46
		styleTextColourR = 110
		styleTextColourG = 90
		styleTextColourB = 52
		styleTextBold = 1
	}
	if(strStyle=="MenuCharacterStatLabel")
	{
		styleTextFont = "Segoe Print"
		styleTextSize = 36
		styleTextColourR = 110
		styleTextColourG = 90
		styleTextColourB = 52
	}
	if(strStyle=="MenuCharacterStatLevel")
	{
		styleTextFont = "Segoe Script"
		styleTextSize = 46
		styleTextColourR = 0
		styleTextColourG = 0
		styleTextColourB = 0
		styleTextBold = 1
	}
	if(strStyle=="MenuCharacterStatValue")
	{
		styleTextFont = "Segoe Script"
		styleTextSize = 36
		styleTextColourR = 0
		styleTextColourG = 0
		styleTextColourB = 0
	}
	if(strStyle=="MenuOption")
	{
		styleTextFont = "Segoe Print"
		styleTextSize = 46
		styleTextColourR = 110
		styleTextColourG = 90
		styleTextColourB = 52
	}
	if(strStyle=="MenuOptionHover")
	{
		styleTextFont = "Segoe Print"
		styleTextSize = 46
		styleTextColourR = 0
		styleTextColourG = 0
		styleTextColourB = 0
	}
	kill(strStyle)
}

function styleTextKill()
{
	kill(styleTextFont)
	kill(styleTextColourR)
	kill(styleTextColourG)
	kill(styleTextColourB)
	kill(styleTextSize)
	kill(styleTextBold)
	kill(styleTextItalics)
	kill(styleTextUnderline)
	kill(styleTextShadow)
	kill(styleTextShadowR)
	kill(styleTextShadowG)
	kill(styleTextShadowB)
}




