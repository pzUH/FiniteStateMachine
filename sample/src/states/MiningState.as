package states 
{
	import entities.*;
	
	import com.pzuh.ai.statemachine.BaseState;
	
	public class MiningState extends BaseState
	{
		public function MiningState(entity:Miner, name:String) 
		{
			super(entity, name);
		}
		
		override public function enter():void 
		{
			if (myEntity.getLoc() != Miner.MINE)
			{
				myEntity.setLoc(Miner.MINE);
				
				trace(myEntity.getName() + ": entering mine, lookin' for some gold chunk");
			}
		}
		
		override public function update():void 
		{
			super.update();
			
			myEntity.increaseGoldCarried();
			myEntity.increaseThirst();
			myEntity.decreaseEnergy();
			
			trace(myEntity.getName() + ": wurking at mine, collecting " + myEntity.getGoldCarried() + 
			" chunk of gold. Current energy: " + myEntity.getEnergy() + ". Thirst level: " +
			myEntity.getThirst());
		}
		
		override public function exit():void 
		{
			trace(myEntity.getName() + ": leavin' this dark gold mine");
		}		
	}
}