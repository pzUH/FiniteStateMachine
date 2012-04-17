package 
{
	/*
	 * Example of FSM implementation
	 * 
	 * Agent: Bob the Miner
	 * 
	 * Number of States: 4
	 * 
	 * States:
		 * AtBank
		 * AtBar
		 * AtHome
		 * Mining
	 * 
	 * State Diagram:
		 * 	
		 * 		______[atBank]
		 * 		|		 |	^
		 * 		v		 v	|
		 * [atHome]--->[mining]--->[atBar]
		 * 					^		 |
		 * 					|________|
	 * */
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	import states.*;
	import entities.*;
	
	public class Main extends Sprite 
	{
		private var myMiner:Miner;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// entry point
			myMiner = new Miner("Bob");
			
			var timer:Timer = new Timer(1000, 0);
			timer.addEventListener(TimerEvent.TIMER, update, false, 0, true);
			timer.start();
		}
		
		private function update(event:TimerEvent):void
		{
			myMiner.update();
		}
	}
	
}