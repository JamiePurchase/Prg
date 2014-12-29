include("Extend/Draw.prg")

function msgSpeak(strSpeaker,strText)
{
	msgBuild()
	msgDraw()
	while(intDone==0)
	{
		strKey = wait()
		if(strKey==" "){intDone = 1}
	}
	kill(intDone)
}

function msgBuild()
{
	createCanvas(1366,768,msgCanvas)
	canvasGetScreen(msgCanvas)
	drawFrame(25,600,1341,743,"",msgCanvas)
	setImageTransparent("Avatars/Player1.png",25,600,125,125,0,255,0,msgCanvas)
}

function msgDraw()
{
	drawCanvas(msgCanvas,0,0)
}

function msgKill()
{
	killCanvas(msgCanvas)
}
