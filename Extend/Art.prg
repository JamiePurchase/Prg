include("Extend/ArtColour.prg")
include("Extend/ArtStyle.prg")
include("Extend/ArtText.prg")

function artColour(color)
{
	artColourList(color)
}

function artDrawAll()
{
	artDrawAll(0,0,0)
}

function artDrawAll(canvas)
{
	artDrawAll(0,0,0,canvas)
}

function artDrawAll(colorR,colorG,colorB)
{
	colorRGB(colorR,colorG,colorB)
	fillRect(0,0,1366,768)
}

function artDrawAll(colorR,colorG,colorB,canvas)
{
	colorRGB(colorR,colorG,colorB)
	fillRect(0,0,1366,768,canvas)
}

function artDrawFrame(drawX1,drawY1,drawX2,drawY2,drawStyle)
{
	artDrawStyleFill(drawStyle)
	fillRect(drawX1,drawY1,drawX2,drawY2)
	artDrawStyleBorder(drawStyle)
	drawRect(drawX1,drawY1,drawX2,drawY2)
	drawX3 = drawX1 + 1
	drawY3 = drawY1 + 1
	drawX4 = drawX2 - 1
	drawY4 = drawY2 - 1
	drawRect(drawX3,drawY3,drawX4,drawY4)
}

function artDrawFrame(drawX1,drawY1,drawX2,drawY2,drawStyle,canvas)
{
	artDrawStyleFill(drawStyle)
	fillRect(drawX1,drawY1,drawX2,drawY2,canvas)
	artDrawStyleBorder(drawStyle)
	drawRect(drawX1,drawY1,drawX2,drawY2,canvas)
	drawX3 = drawX1 + 1
	drawY3 = drawY1 + 1
	drawX4 = drawX2 - 1
	drawY4 = drawY2 - 1
	drawRect(drawX3,drawY3,drawX4,drawY4,canvas)
}

function artDrawImage(imageFile,imagePosX,imagePosY,imageWidth,imageHeight)
{
	setImage(imageFile,imagePosX,imagePosY,imageWidth,imageHeight)
}

function artDrawImage(imageFile,imagePosX,imagePosY,imageWidth,imageHeight,canvas)
{
	setImage(imageFile,imagePosX,imagePosY,imageWidth,imageHeight,canvas)
}

function artDrawImageCentre(imageFile,imagePosY,imageWidth,imageHeight)
{
	imageOffset = imageWidth / 2
	imagePosX = 683 - imageOffset
	setImage(imageFile,imagePosX,imagePosY,imageWidth,imageHeight)
}

function artDrawImageCentre(imageFile,imagePosY,imageWidth,imageHeight,canvas)
{
	imageOffset = imageWidth / 2
	imagePosX = 683 - imageOffset
	setImage(imageFile,imagePosX,imagePosY,imageWidth,imageHeight,canvas)
}

function artDrawImageCentreTransparent(imageFile,imagePosY,imageWidth,imageHeight,colorR,colorG,colorB)
{
	imageOffset = imageWidth / 2
	imagePosX = 683 - imageOffset
	setImageTransparent(imageFile,imagePosX,imagePosY,colorR,colorG,colorB,imageWidth,imageHeight)
}

function artDrawImageCentreTransparent(imageFile,imagePosY,imageWidth,imageHeight,colorR,colorG,colorB,canvas)
{
	imageOffset = imageWidth / 2
	imagePosX = 683 - imageOffset
	setImageTransparent(imageFile,imagePosX,imagePosY,colorR,colorG,colorB,imageWidth,imageHeight,canvas)
}

function artDrawImageTransparent(imageFile,imagePosX,imagePosY,imageWidth,imageHeight,colorR,colorG,colorB)
{
	setImageTransparent(imageFile,imagePosX,imagePosY,colorR,colorG,colorB,imageWidth,imageHeight)
}

function artDrawImageTransparent(imageFile,imagePosX,imagePosY,imageWidth,imageHeight,colorR,colorG,colorB,canvas)
{
	setImageTransparent(imageFile,imagePosX,imagePosY,colorR,colorG,colorB,imageWidth,imageHeight,canvas)
}

function artTextCentre(textString,textStyle,textPosX,textPosY)
{
	artTextStyle(textStyle)
	textOffset = getTextWidth(textString) /2
	textPosX = textPosX - textOffset
	pixelText(textPosX,textPosY,textString)
	artTextSave(textPosX,textPosY,"C")
}

function artTextCentre(textString,textStyle,textPosX,textPosY,canvas)
{
	artTextStyle(textStyle)
	textOffset = getTextWidth(textString) /2
	textPosX = textPosX - textOffset
	pixelText(textPosX,textPosY,textString,canvas)
	artTextSave(textPosX,textPosY,"C")
}

function artTextCentreScreen(textString,textStyle,textPosY)
{
	artTextStyle(textStyle)
	textWidth = getTextWidth(textString)
	textOffset = textWidth / 2
	textPosX = 683 - textOffset
	pixelText(textPosX,textPosY,textString)
	artTextSave(textPosX,textPosY,"CS")
}

function artTextCentreScreen(textString,textStyle,textPosY,canvas)
{
	artTextStyle(textStyle)
	textWidth = getTextWidth(textString)
	textOffset = textWidth / 2
	textPosX = 683 - textOffset
	pixelText(textPosX,textPosY,textString,canvas)
	artTextSave(textPosX,textPosY,"CS")
}

function artTextLeft(textString,textStyle,textPosX,textPosY)
{
	artTextStyle(textStyle)
	pixelText(textPosX,textPosY,textString)
	artTextSave(textPosX,textPosY)
}

function artTextLeft(textString,textStyle,textPosX,textPosY,canvas)
{
	artTextStyle(textStyle)
	pixelText(textPosX,textPosY,textString,canvas)
	artTextSave(textPosX,textPosY)
}

function artTextNext(textString,textStyle)
{
	artTextStyle(textStyle)
	textPosX = global(artTextPosX)
	textPosY = global(artTextPosY) + global(artTextSize)
	pixelText(textPosX,textPosY,textString)
	if(artTextType=="C"){artTextCentre(textString,textStyle,textPosX,textPosY)}
	if(artTextType=="CS"){artTextCenterScreen(textString,textStyle)}
	if(artTextType=="L"){artTextLeft(textString,textStyle,textPosX,textPosY)}
	if(artTextType=="R"){artTextRight(textString,textStyle,textPosX,textPosY)}
}

function artTextNext(textString,textStyle,canvas)
{
	artTextStyle(textStyle)
	textPosX = global(artTextPosX)
	textPosY = global(artTextPosY) + global(artTextSize)
	pixelText(textPosX,textPosY,textString)
	if(artTextType=="C"){artTextCentre(textString,textStyle,textPosX,textPosY,canvas)}
	if(artTextType=="CS"){artTextCenterScreen(textString,textStyle,canvas)}
	if(artTextType=="L"){artTextLeft(textString,textStyle,textPosX,textPosY,canvas)}
	if(artTextType=="R"){artTextRight(textString,textStyle,textPosX,textPosY,canvas)}
}

function artTextRight(textString,textStyle,textPosX,textPosY)
{
	artTextStyle(textStyle)
	textPosX = textPosX - getTextWidth(textString)
	pixelText(textPosX,textPosY,textString)
	artTextSave(textPosX,textPosY,"R")
}

function artTextRight(textString,textStyle,textPosX,textPosY,canvas)
{
	artTextStyle(textStyle)
	textPosX = textPosX - getTextWidth(textString)
	pixelText(textPosX,textPosY,textString,canvas)
	artTextSave(textPosX,textPosY,"R")
}

function artTextSave(textPosX,textPosY)
{
	global(artTextPosX) = textPosX
	global(artTextPosY) = textPosY
	global(artTextType) = "L"
}

function artTextSave(textPosX,textPosY,textType)
{
	global(artTextPosX) = textPosX
	global(artTextPosY) = textPosY
	global(artTextType) = textType
}





