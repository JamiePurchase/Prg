function battleAnim()
{
	battleAnimFrame = 0
}

function battleAnimAdd(cnvFrame,intDelay)
{
	battleAnimFrames = battleAnimFrames + 1
	battleAnimCanvas[battleAnimFrames] = cnvFrame
	battleAnimDelay[battleAnimFrames] = intDelay
	kill(cnvFrame)
	kill(intDelay)
}

function battleAnimKill()
{
	kill(battleAnimCanvas)
	kill(battleAnimDelay)
	kill(battleAnimFrames)
}

function battleAnimRender()
{
	for(intFrame=1;intFrame<=battleAnimFramesMax;intFrame=intFrame+1)
	{
		drawCanvas(battleAnimCanvas[intFrame],0,0)
		delay(battleAnimDelay[intFrame])
	}
	kill(intFrame)
}
