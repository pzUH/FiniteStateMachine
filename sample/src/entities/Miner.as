package entities 
{	
	import states.*;
	
	import com.pzuh.ai.statemachine.FiniteStateMachine;
	import com.pzuh.ai.statemachine.IState;
	
	public class Miner extends BaseEntity
	{
		private var myStateMachine:FiniteStateMachine;
		
		public static const MINE:String = "Mine";
		public static const BANK:String = "Bank";
		public static const BAR:String = "Bar";
		public static const HOME:String = "Home";
		
		protected var goldCarried:int;
		protected const maxGoldCarried:int = 3;
		
		protected var goldAtBank:int;
		protected const wealthy:int = 30;
		
		public function Miner(name:String) 
		{
			super(name);
			
			goldCarried = 0;
			goldAtBank = 0;
			
			myStateMachine = new FiniteStateMachine();
			myStateMachine.changeState(new MiningState(this));
		}
		
		override public function update():void
		{
			myStateMachine.update();
		}
		
		public function isPocketFull():Boolean
		{
			var temp:Boolean;
			
			if (goldCarried >= maxGoldCarried)
			{
				temp = true;
			}
			else
			{
				temp = false;
			}
			
			return temp;
		}
		
		public function isWealthy():Boolean
		{
			var temp:Boolean;
			
			if (goldAtBank >= wealthy)
			{
				temp = true;
			}
			else
			{
				temp = false;
			}
			
			return temp;
		}
		
		public function increaseGoldCarried():void
		{
			goldCarried++;
		}
		
		public function depositGold():void
		{
			goldAtBank += goldCarried;
			goldCarried = 0;
		}
		
		//getter setter
		public function getGoldCarried():int
		{
			return goldCarried;
		}
		
		public function getGoldAtBank():int
		{
			return goldAtBank;
		}
		
		public function getStateMachine():FiniteStateMachine
		{
			return myStateMachine;
		}
	}
}