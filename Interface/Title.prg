include("Extend/Draw.prg")

:Title
titleBuild()
branch(:TitleDraw)

:TitleDraw
titleDraw()
branch(:TitleWait)

:TitleWait
intResult = titleWait()
if(intResult==1){branch(:TitleDraw)}
if(intResult==2){branch(:TitleSelect)}
if(intResult==3){branch(:TitleQuit)}
branch(:TitleWait)

:TitleSelect
if(titleMenuPos==1)
{
	titleKill()
	run("gameNew.prg")
}
if(titleMenuPos==2)
{
	titleKill()
	run("gameLoad.prg")
}
if(titleMenuPos==3){branch(:TitleQuit)}

:TitleQuit
windows()

// FUNCTIONS

function titleBuild()
{
	createCanvas(1366,768,titleCanvas)
	drawColour("Slate")
	colorRGB(0,0,0)
	fillRect(0,0,1366,768,titleCanvas)
	setImage("Interface/TitleLogo.png",533,50,300,120,titleCanvas)
	setImage("Interface/TitleTK.png",50,675,500,60,titleCanvas)
	drawTextLeft("New Game","TitleOption",800,300,titleCanvas)
	drawTextLeft("Continue","TitleOption",800,350,titleCanvas)
	drawTextLeft("End Game","TitleOption",800,400,titleCanvas)
	titleMenuPos = 1
	titleMenuMax = 3
}

function titleDraw()
{
	drawCanvas(titleCanvas,0,0)
	intPosY = 50 * titleMenuPos + 250
	drawTextLeft(">","TitleOption",775,intPosY)
	kill(intPosY)
}

function titleKill()
{
	kill(titleMenuPos)
	kill(titleMenuMax)
	killCanvas(titleCanvas)
}

function titleWait()
{
	intResult = 0
	strKey = wait()
	if(strKey==" "){intResult = 2}
	if(strKey=="ESC"){intResult = 3}
	if(strKey=="UP" && titleMenuPos>1)
	{
		titleMenuPos = titleMenuPos - 1
		intResult = 1
	}
	if(strKey=="DOWN" && titleMenuPos<titleMenuMax)
	{
		titleMenuPos = titleMenuPos + 1
		intResult = 1
	}
	kill(strKey)
	return(intResult)
}



