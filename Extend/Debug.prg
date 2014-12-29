function debugLog()
{
	debugLogItems = 0
}

function debugLogAdd(strText)
{
	intLog = debugLogItems + 1
	debugLogTick[intLog] = getTickCount()
	debugLogText[intLog] = strText
	debugLogItems = debugLogItems + 1
	kill(strText)
	kill(intLog)
}

function debugLogView()
{
	// Save Screen
	createCanvas(1366,768,debugLogCanvas)
	canvasGetScreen(debugLogCanvas)

	// Draw Log
	colorRGB(0,0,0)
	fillRect(0,0,1366,768)
	artTextLeft("Debug","",50,50)
	for(intLog=1;intLog<=debugLogItems;intLog=intLog+1)
	{
		intPosY = 35 * intLog + 65
		artTextLeft(intLog,"",50,intPosY)
		artTextLeft(debugLogTick[intLog],"",100,intPosY)
		artTextLeft(debugLogText[intLog],"",400,intPosY)
	}

	// Done
	wait()

	// Kill Variables
	kill(intLog)
	kill(intPosY)
	killCanvas(debugLogCanvas)
}
