package entities 
{	
	import com.pzuh.ai.statemachine.BaseState;
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
			
			initState();
		}
		
		//the example for initializing the state machine
		private function initState():void
		{
			myStateMachine = new FiniteStateMachine();
			
			//initialize the states
			var atBankState:BaseState = new AtBankState(this, BANK);
			var atBarState:BaseState = new AtBarState(this, BAR);
			
			//this is an example of state which its transition defined outside the state class
			//simply call the addTransition method and define the target state and also the trigger
			var atMineState:BaseState = new MiningState(this, MINE);
			atMineState.addTransition(BANK, isPocketFull);
			atMineState.addTransition(BAR, isThirsty);
			atMineState.addTransition(HOME, isTired);
			
			//this is an example of state which doesn't have a concrete state class
			//so, the transition and also the action must be defined here
			var atHomeState:BaseState = new BaseState(this, HOME);
			atHomeState.addTransition(MINE, isFullyRested);
			atHomeState.addAction(atHome, enterHome, exitHome);			
			
			//insert all the states to the state machine
			myStateMachine.addState([atBankState, atBarState, atMineState, atHomeState]);
			
			//set the initial state to start
			changeState(HOME);
		}
		
		override public function update():void
		{
			//don't forget to call update method, so the machine can be updated regularly
			myStateMachine.update();
		}
		
		public function changeState(state:String):void
		{
			myStateMachine.changeState(state);
		}
		
		private function atHome():void
		{
			increaseEnergy();
			
			trace(name + ": is sleeping, energy: " + energy);
		}
		
		private function enterHome():void
		{
			if (getLoc() != HOME)
			{
				setLoc(HOME);
				
				trace(name + ": Home sweet home");
			}
		}
		
		private function exitHome():void
		{
			trace(name + ": leavin this fuckin' old house");
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