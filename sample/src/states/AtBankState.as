package states 
{	
	import entities.*;
	
	import com.pzuh.ai.statemachine.IState;
	
	public class AtBankState implements IState
	{
		private var myEntity:Miner;
		
		public function AtBankState(entity:Miner) 
		{
			myEntity = entity;
		}
		
		/* INTERFACE IState */
		
		public function enter():void 
		{
			if (myEntity.getLoc() != Miner.BANK)
			{
				trace(myEntity.getName() +": inside the bank now, ready to deposit some gold");
				
				myEntity.setLoc(Miner.BANK);
			}
		}
		
		public function update():void 
		{
			myEntity.depositGold();
			
			trace(myEntity.getName() + ": deposit gold in tha pocket to my bank account. " + 
			"Now i have " + myEntity.getGoldAtBank() + " gold in my account");
			
			if (myEntity.isWealthy() == true)
			{
				trace(myEntity.getName() + ": I'm rich, now I can sleep at home");
				
				myEntity.getStateMachine().changeState(new AtHomeState(myEntity));
			}
			else
			{
				trace(myEntity.getName() + ": Uhm, I still a poor guy, need to lookin' sum gold at the mine");
				
				myEntity.getStateMachine().changeState(new MiningState(myEntity));
			}
		}
		
		public function exit():void 
		{
			trace(myEntity.getName() + ": leavin' the bank");
		}		
	}
}