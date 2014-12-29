include("Styles/Colour.prg")
include("Styles/Text.prg")

function drawAll(intColorR,intColorG,intColorB)
{
	getRes(intResX,intResY)
	colorRGB(intColorR,intColorG,intColorB)
	fillRect(0,0,intResX,intResY)
	kill(intColorR)
	kill(intColorG)
	kill(intColorB)
	kill(intResX)
	kill(intResY)
}

function drawAll(intColorR,intColorG,intColorB,cnvDraw)
{
	getRes(intResX,intResY)
	colorRGB(intColorR,intColorG,intColorB)
	fillRect(0,0,intResX,intResY,cnvDraw)
	kill(intColorR)
	kill(intColorG)
	kill(intColorB)
	kill(cnvDraw)
	kill(intResX)
	kill(intResY)
}

function drawColour(strColour)
{
	styleColour(strColour)
	kill(strColour)
}

function drawFrame(intPosX1,intPosY1,intPosX2,intPosY2,strScheme)
{
	drawFrame(intPosX1,intPosY1,intPosX2,intPosY2,strScheme,"none")
	kill(intPosX1)
	kill(intPosY1)
	kill(intPosX2)
	kill(intPosY2)
	kill(strScheme)
}

function drawFrame(intPosX1,intPosY1,intPosX2,intPosY2,strScheme,cnvDraw)
{
	if(strScheme==""){strScheme = "Standard"}

	if(strScheme=="Standard")
	{
		intShadowR = 200
		intShadowG = 180
		intShadowB = 145
		intBackR = 220
		intBackG = 190
		intBackB = 131
		intBorderR = 110
		intBorderG = 90
		intBorderB = 52
	}

	if(strScheme=="MenuOption")
	{
		intShadowR = 200
		intShadowG = 180
		intShadowB = 145
		intBackR = 220
		intBackG = 190
		intBackB = 131
		intBorderR = 110
		intBorderG = 90
		intBorderB = 52
	}

	if(strScheme=="MenuOptionHover")
	{
		intShadowR = 200
		intShadowG = 180
		intShadowB = 145
		intBackR = 225
		intBackG = 223
		intBackB = 125
		intBorderR = 110
		intBorderG = 90
		intBorderB = 52
	}
	
	// Draw Shadow
	colorRGB(intShadowR,intShadowG,intShadowB)
	if(cnvDraw=="none")
	{
		drawRect(intPosX1+1,intPosY1+1,intPosX2+1,intPosY2+1)
		drawRect(intPosX1+2,intPosY1+2,intPosX2+2,intPosY2+2)
	}
	else
	{
		drawRect(intPosX1+1,intPosY1+1,intPosX2+1,intPosY2+1,cnvDraw)
		drawRect(intPosX1+2,intPosY1+2,intPosX2+2,intPosY2+2,cnvDraw)
	}
	
	// Draw Background
	colorRGB(intBackR,intBackG,intBackB)
	if(cnvDraw=="none")
	{
		fillRect(intPosX1,intPosY1,intPosX2,intPosY2)
	}
	else
	{
		fillRect(intPosX1,intPosY1,intPosX2,intPosY2,cnvDraw)
	}
	
	// Draw Border
	colorRGB(intBorderR,intBorderG,intBorderB)
	if(cnvDraw=="none")
	{
		drawRect(intPosX1,intPosY1,intPosX2,intPosY2)
	}
	else
	{
		drawRect(intPosX1,intPosY1,intPosX2,intPosY2,cnvDraw)
	}
	
	// Kill Variables
	kill(intPosX1)
	kill(intPosY1)
	kill(intPosX2)
	kill(intPosY2)
	kill(strScheme)
	kill(intShadowR)
	kill(intShadowG)
	kill(intShadowB)
	kill(intBackR)
	kill(intBackG)
	kill(intBackB)
	kill(intBorderR)
	kill(intBorderG)
	kill(intBorderB)
	kill(cnvDraw)
}

function drawTextCenter(strText,strStyle,intPosX,intPosY)
{
	drawTextCenter(strText,strStyle,intPosX,intPosY,"none")
	kill(strText)
	kill(strStyle)
	kill(intPosX)
	kill(intPosY)
}

function drawTextCenter(strText,strStyle,intPosX,intPosY,cnvDraw)
{
	// Save Colour
	getColor(intSaveR,intSaveG,intSaveB)
	
	// Get Style Info
	drawTextStyle(strStyle)
	
	// Get Text Position
	intOffset = getTextWidth(strText) /2
	intPosX = intPosX - intOffset
	
	// Draw Shadow
	if(styleTextShadow>0)
	{
		colorRGB(styleTextShadowR,styleTextShadowG,styleTextShadowB)
		if(cnvDraw=="none"){pixelText(intPosX+styleTextShadow,intPosY+styleTextShadow,strText)}
		else{pixelText(intPosX+styleTextShadow,intPosY+styleTextShadow,strText,cnvDraw)}
	}
	
	// Draw Text
	colorRGB(styleTextColourR,styleTextColourG,styleTextColourB)
	if(cnvDraw=="none"){pixelText(intPosX,intPosY,strText)}
	else{pixelText(intPosX,intPosY,strText,cnvDraw)}
	
	// Restore Colour
	colorRGB(intSaveR,intSaveG,intSaveB)
	
	// Kill Style Info
	styleTextKill()
	
	// Kill Variables
	kill(strText)
	kill(strStyle)
	kill(intPosX)
	kill(intPosY)
	kill(cnvDraw)
	kill(intSaveR)
	kill(intSaveG)
	kill(intSaveB)
	kill(intOffset)
}

function drawTextCenterScreen(strText,strStyle,intPosY)
{
	drawTextCenterScreen(strText,strStyle,intPosY,"none")
	kill(strText)
	kill(strStyle)
	kill(intPosY)
}

function drawTextCenterScreen(strText,strStyle,intPosY,cnvDraw)
{
	getRes(intResX,intResY)
	intPosX = intResX / 2
	drawTextCenter(strText,strStyle,intPosX,intPosY,cnvDraw)
	kill(strText)
	kill(strStyle)
	kill(intPosY)
	kill(cnvDraw)
	kill(intResX)
	kill(intResY)
	kill(intPosX)
}

function drawTextLeft(strText,strStyle,intPosX,intPosY)
{
	drawTextLeft(strText,strStyle,intPosX,intPosY,"none")
	kill(strText)
	kill(strStyle)
	kill(intPosX)
	kill(intPosY)
}

function drawTextLeft(strText,strStyle,intPosX,intPosY,cnvDraw)
{
	// Save Colour
	getColor(intSaveR,intSaveG,intSaveB)
	
	// Get Style Info
	drawTextStyle(strStyle)
	
	// Draw Shadow
	if(styleTextShadow>0)
	{
		colorRGB(styleTextShadowR,styleTextShadowG,styleTextShadowB)
		if(cnvDraw=="none"){pixelText(intPosX+styleTextShadow,intPosY+styleTextShadow,strText)}
		else{pixelText(intPosX+styleTextShadow,intPosY+styleTextShadow,strText,cnvDraw)}
	}
	
	// Draw Text
	colorRGB(styleTextColourR,styleTextColourG,styleTextColourB)
	if(cnvDraw=="none"){pixelText(intPosX,intPosY,strText)}
	else{pixelText(intPosX,intPosY,strText,cnvDraw)}
	
	// Restore Colour
	colorRGB(intSaveR,intSaveG,intSaveB)
	
	// Kill Style Info
	styleTextKill()
	
	// Kill Variables
	kill(strText)
	kill(strStyle)
	kill(intPosX)
	kill(intPosY)
	kill(cnvDraw)
	kill(intSaveR)
	kill(intSaveG)
	kill(intSaveB)
}

function drawTextRight(strText,strStyle,intPosX,intPosY)
{
	drawTextRight(strText,strStyle,intPosX,intPosY,"none")
	kill(strText)
	kill(strStyle)
	kill(intPosX)
	kill(intPosY)
}

function drawTextRight(strText,strStyle,intPosX,intPosY,cnvDraw)
{
	// Save Colour
	getColor(intSaveR,intSaveG,intSaveB)
	
	// Get Style Info
	drawTextStyle(strStyle)
	
	// Get Text Position
	intPosX = intPosX - getTextWidth(strText)
	
	// Draw Shadow
	if(styleTextShadow>0)
	{
		colorRGB(styleTextShadowR,styleTextShadowG,styleTextShadowB)
		if(cnvDraw=="none"){pixelText(intPosX+styleTextShadow,intPosY+styleTextShadow,strText)}
		else{pixelText(intPosX+styleTextShadow,intPosY+styleTextShadow,strText,cnvDraw)}
	}
	
	// Draw Text
	colorRGB(styleTextColourR,styleTextColourG,styleTextColourB)
	if(cnvDraw=="none"){pixelText(intPosX,intPosY,strText)}
	else{pixelText(intPosX,intPosY,strText,cnvDraw)}
	
	// Restore Colour
	colorRGB(intSaveR,intSaveG,intSaveB)
	
	// Kill Style Info
	styleTextKill()
	
	// Kill Variables
	kill(strText)
	kill(strStyle)
	kill(intPosX)
	kill(intPosY)
	kill(cnvDraw)
	kill(intSaveR)
	kill(intSaveG)
	kill(intSaveB)
}

function drawTextStyle(strStyle)
{
	// Default Style
	if(strStyle==""){strStyle = "Standard"}
	
	// Default Format
	colorRGB(0,0,0)
	font("Segoe Print")
	fontSize(32)
	bold("off")
	italics("off")
	underline("off")
	
	// Get Style Info
	styleText(strStyle)
	
	// Apply Style Info
	font(styleTextFont)
	fontSize(styleTextSize)
	if(styleTextBold==1){bold("on")}
	if(styleTextItalics==1){italics("on")}
	if(styleTextUnderline==1){underline("on")}
	
	// Kill Variables
	kill(strStyle)
}








