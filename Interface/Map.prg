include("Extend/Draw.prg")

:Map
mapBuild()
branch(:MapDraw)

:MapDraw
mapDraw()
branch(:MapWait)

:MapWait
intResult = mapWait()
if(intResult==1){branch(:MapDraw)}
if(intResult==2){branch(:MapSelect)}
if(intResult==3){branch(:MapDone)}
branch(:MapWait)

:MapSelect

:MapDone
mapKill()

// FUNCTIONS

function mapBuild()
{
	createCanvas(1366,768,mapCanvas)
	canvasGetScreen(mapCanvas)
	setImageTransparent("Interface/MapBkg.png",0,0,1366,768,0,255,0,mapCanvas)
	mapCursorPosX = 5
	mapCursorPosY = 5
	mapCursorMaxX = 10
	mapCursorMaxY = 10
}

function mapDraw()
{
	drawCanvas(mapCanvas,0,0)
}

function mapKill()
{
	kill(mapCursorPosX)
	kill(mapCursorPosY)
	kill(mapCursorMaxX)
	kill(mapCursorMaxY)
	killCanvas(mapCanvas)
}

function mapWait()
{
	intResult = 0
	strKey = wait()
	if(strKey==" "){intResult = 2}
	if(strKey=="ESC"){intResult = 3}
	if(strKey=="UP" && mapCursorPosX>1)
	{
		mapCursorPosX = mapCursorPosX - 1
		intResult = 1
	}
	if(strKey=="DOWN" && mapCursorPosX<mapCursorMaxX)
	{
		mapCursorPosX = mapCursorPosX + 1
		intResult = 1
	}
	if(strKey=="LEFT" && mapCursorPosY>1)
	{
		mapCursorPosY = mapCursorPosY - 1
		intResult = 1
	}
	if(strKey=="RIGHT" && mapCursorPosY<mapCursorMaxY)
	{
		mapCursorPosY = mapCursorPosY + 1
		intResult = 1
	}
	kill(strKey)
	return(intResult)
}
