include("extendArt.prg")

function battleDebugBuildInfo()
{
	createCanvas(166,368,battleDebug)
	artDrawAll(0,255,0,battleDebug)
	artDrawFrame(0,0,166,368,"MenuFrame",battleDebug)
}

function battleDebugDrawInfo()
{
	if(battleDebugActive==1 && battleDebugActiveInfo==1)
	{
		string1 = "P1 Wait: "+battleAllyTimeWait[1]
		createCanvas(166,368,battleDebugDraw)
		drawCanvas(battleDebug,0,0,1366,768,battleDebugDraw)
		artTextLeft("Debug","DebugText",25,25)
		artTextLeft(string1,"DebugText",35,60)
		drawCanvas(battleDebugDraw,600,200)
	}
}
