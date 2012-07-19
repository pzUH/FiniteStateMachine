package states 
{	
	import entities.*;
	
	import com.pzuh.ai.statemachine.BaseState
	
	public class AtBankState extends BaseState
	{
		public function AtBankState(entity:Miner, name:String) 
		{
			super(entity, name);
		}
		
		override public function enter():void 
		{
			if (myEntity.getLoc() != Miner.BANK)
			{
				trace(myEntity.getName() +": inside the bank now, ready to deposit some gold");
				
				myEntity.setLoc(Miner.BANK);
			}
		}
		
		override public function update():void 
		{
			myEntity.depositGold();
			
			trace(myEntity.getName() + ": deposit gold in tha pocket to my bank account. " + 
			"Now i have " + myEntity.getGoldAtBank() + " gold in my account");
			
			if (myEntity.isWealthy() == true)
			{
				trace(myEntity.getName() + ": I'm rich, now I can sleep at home");
				
				myEntity.changeState(Miner.HOME);
			}
			else
			{
				trace(myEntity.getName() + ": Uhm, I still a poor guy, need to lookin' sum gold at the mine");
				
				myEntity.changeState(Miner.MINE);
			}
		}
		
		override public function exit():void 
		{
			trace(myEntity.getName() + ": leavin' the bank");
		}		
	}
}