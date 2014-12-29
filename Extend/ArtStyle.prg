function artDrawStyle(drawStyle)
{
	styleBorderColorR = 255
	styleBorderColorG = 255
	styleBorderColorB = 255
	styleBorderWidth = 2
	styleFillColorR = 0
	styleFillColorG = 0
	styleFillColorB = 0
	if(drawStyle=="DebugFrame")
	{
	}
	styleList = styleBorderColorR
	styleList = listAppend(styleList,styleBorderColorG)
	styleList = listAppend(styleList,styleBorderColorB)
	styleList = listAppend(styleList,styleBorderWidth)
	styleList = listAppend(styleList,styleFillColorR)
	styleList = listAppend(styleList,styleFillColorG)
	styleList = listAppend(styleList,styleFillColorB)
	return(styleList)
}

function artDrawStyleBorder(drawStyle)
{
	colorRGB(255,255,255)

	if(drawStyle=="DebugFrame")
	{
		colorRGB(0,50,0)
	}
	if(drawStyle=="MenuFrame")
	{
		colorRGB(0,50,0)
	}
}

function artDrawStyleFill(drawStyle)
{
	colorRGB(0,0,0)
	
	if(drawStyle=="MenuFrame")
	{
		colorRGB(0,0,0)
	}
}

