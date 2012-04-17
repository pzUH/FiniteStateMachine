package states 
{
	import entities.*;
	
	import com.pzuh.ai.statemachine.IState;
	
	public class MiningState implements IState
	{
		private var myEntity:Miner;
		
		public function MiningState(entity:Miner) 
		{
			myEntity = entity;
		}
		
		/* INTERFACE IState */
		
		public function enter():void 
		{
			if (myEntity.getLoc() != Miner.MINE)
			{
				myEntity.setLoc(Miner.MINE);
				
				trace(myEntity.getName() + ": entering mine, lookin' for some gold chunk");
			}
		}
		
		public function update():void 
		{
			myEntity.increaseGoldCarried();
			myEntity.increaseThirst();
			myEntity.decreaseEnergy();
			
			trace(myEntity.getName() + ": wurking at mine, collecting " + myEntity.getGoldCarried() + 
			" chunk of gold. Current energy: " + myEntity.getEnergy() + ". Thirst level: " +
			myEntity.getThirst());
			
			
			if (myEntity.isTired() == true)
			{
				trace(myEntity.getName() + " : I'm tired, heading to home now");
				
				myEntity.getStateMachine().changeState(new AtHomeState(myEntity));
			}
			
			if (myEntity.isThirsty() == true)
			{
				trace(myEntity.getName() + " : I'm thirsty, lookin' some cold beer at the bar");
				
				myEntity.getStateMachine().changeState(new AtBarState(myEntity));
			}
			
			if (myEntity.isPocketFull() == true)
			{
				trace(myEntity.getName() + " : Mah pocket is full of gold, I should go to the bank");
				
				myEntity.getStateMachine().changeState(new AtBankState(myEntity));
			}
		}
		
		public function exit():void 
		{
			trace(myEntity.getName() + ": leavin' this dark gold mine");
		}		
	}
}