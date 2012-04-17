package states 
{
	import com.pzuh.ai.statemachine.*;
	
	import entities.*;
	
	public class AtHomeState implements IState
	{
		private var myEntity:Miner;
		
		public function AtHomeState(entity:Miner) 
		{
			myEntity = entity;
		}
		
		/* INTERFACE IState */
		
		public function enter():void 
		{
			if (myEntity.getLoc() != Miner.HOME)
			{
				myEntity.setLoc(Miner.HOME);
				
				trace(myEntity.getName() + ": Home sweet home");
			}
		}
		
		public function update():void 
		{
			myEntity.increaseEnergy();
			
			trace(myEntity.getName() + ": is sleeping, energy: " + myEntity.getEnergy());
			
			if (myEntity.isFullyRested() == true)
			{
				trace(myEntity.getName() + ": I'm fully rested, heading to the mine now");
				
				myEntity.getStateMachine().changeState(new MiningState(myEntity));				
			}
		}
		
		public function exit():void 
		{
			trace(myEntity.getName() + ": leavin this fuckin' old house");
		}		
	}
}