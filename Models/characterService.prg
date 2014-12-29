include("Models/characterClass.prg")

function characterCreate(strTemplate)
{
	// Load Data
	strFile = "Data/Characters/" + strTemplate + ".txt"
	txtData = ioOpen(strFile,"r")

	// Read Data
	strInfoName = ioRead(txtData)
	intStatHPC = ioRead(txtData)
	intRankLVL = ioRead(txtData)
	ioClose(txtData)

	// Create Character
	objCharacter = character(strInfoName)
	objCharacter->setStatHPC(intStatHPC)
	objCharacter->setRankLVL(intRankLVL)

	// Kill Variables
	kill(strTemplate)
	kill(strFile)
	kill(strInfoName)
	kill(intStatHPC)
	kill(intRankLVL)

	// Return Character
	return(objCharacter)
}

function characterLoad()
{
	// Load a character from a save file
	// Ensure that the character is positioned correctly in the party
}





