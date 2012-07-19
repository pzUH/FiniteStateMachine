package states 
{
	import com.pzuh.ai.statemachine.*;
	
	import entities.*;
	
	public class AtBarState extends BaseState
	{
		public function AtBarState(entity:Miner, name:String) 
		{
			super(entity, name);
		}
		
		override public function enter():void 
		{
			if (myEntity.getLoc() != Miner.BAR)
			{
				myEntity.setLoc(Miner.BAR);
				
				trace(myEntity.getName() + ": Entering the cozy bar, lookin' sumthin' to drink");
			}
		}
		
		override public function update():void 
		{
			myEntity.decreaseThirst();
			
			trace(myEntity.getName() + ": drinkin' a goddamn cold beer, thanks God. " +
			"Thirst level: " + myEntity.getThirst());
			
			if (myEntity.isNotThirsty() == true)
			{
				trace(myEntity.getName() + ": i'm fully loaded, ready to work again");
				
				myEntity.changeState(Miner.MINE);
			}
		}
		
		override public function exit():void 
		{
			trace(myEntity.getName() + " leavin' this fuckin' great bar");
		}		
	}
}