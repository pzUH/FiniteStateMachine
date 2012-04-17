package states 
{
	import com.pzuh.ai.statemachine.*;
	
	import entities.*;
	
	public class AtBarState implements IState
	{
		private var myEntity:Miner;
		
		public function AtBarState(entity:Miner) 
		{
			myEntity = entity;
		}
		
		/* INTERFACE IState */
		
		public function enter():void 
		{
			if (myEntity.getLoc() != Miner.BAR)
			{
				myEntity.setLoc(Miner.BAR);
				
				trace(myEntity.getName() + ": Entering the cozy bar, lookin' sumthin' to drink");
			}
		}
		
		public function update():void 
		{
			myEntity.decreaseThirst();
			
			trace(myEntity.getName() + ": drinkin' a goddamn cold beer, thanks God. " +
			"Thirst level: " + myEntity.getThirst());
			
			if (myEntity.isNotThirsty() == true)
			{
				trace(myEntity.getName() + ": i'm fully loaded, ready to work again");
				
				myEntity.getStateMachine().changeState(new MiningState(myEntity));
			}
		}
		
		public function exit():void 
		{
			trace(myEntity.getName() + " leavin' this fuckin' great bar");
		}		
	}
}