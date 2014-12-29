class character
{
	public:

		method character(strInfoName)
		{
			this->infoName = strInfoName
			this->statHPC = 0
			this->statHPM = 0
			this->statMPC = 0
			this->statMPM = 0
			this->statFPC = 0
			this->statFRC = 0
			this->statFRM = 0
			this->rankLVL = 0
			this->rankEXP = 0
			this->rankREQ = 0
			this->itemWPN = 0
			this->itemAC1 = 0
			this->itemAC2 = 0
		}

		method getInfoName()
		{
			return this->infoName
		}

		method getRankLVL()
		{
			return this->rankLVL
		}

		method getStatHPC()
		{
			return this->statHPC
		}

		method getStatHPM()
		{
			return this->statHPC
		}

		method setRankLVL(intAmount)
		{
			this->rankLVL = intAmount
			kill(intAmount)
		}

		method setStatHPC(intAmount)
		{
			this->statHPC = intAmount
			kill(intAmount)
		}

		method setStatHPM(intAmount)
		{
			this->statHPC = intAmount
			kill(intAmount)
		}
		
	private:
		
		var infoName
		var itemAC1
		var itemAC2
		var itemWPN
		var rankEXP
		var rankLVL
		var rankREQ
		var statFPC
		var statFRC
		var statFRM
		var statHPC
		var statHPM
		var statMPC
		var statMPM
}


