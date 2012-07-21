package com.pzuh.ai.statemachine
{	
	public class FiniteStateMachine
	{
		private var currentState:BaseState;
		
		//global state: a state to control transition for multiple states which have same transition to several target states
		//just a hack if you didn't want to implement a Hierarchical State Machine
		private var globalState:BaseState;
		
		private var stateArray:Array = new Array();
		
		public function FiniteStateMachine() 
		{
			currentState = null;
			globalState = null;
		}
		
		public function addState(...rest):void
		{
			for (var i:int = 0; i < rest.length; i++)
			{
				if (stateArray.indexOf(rest[i]) == -1)
				{
					stateArray.push(rest[i]);
				}
			}
		}
		
		//call this method on the entity main loop/update
		public function update():void
		{
			currentState.update();
			
			if (globalState != null)
			{
				globalState.update();
			}
		}
		
		public function changeState(targetState:String):void
		{
			var nextState:BaseState = getState(targetState);
			
			if (currentState != null) 
			{
				currentState.exit();
			}
			
			currentState = nextState;
			currentState.enter();
		}
		
		public function removeSelf():void
		{
			for (var i:int = stateArray.length - 1; i >= 0; i--)
			{
				stateArray[i].removeSelf();
				stateArray.splice(i, 1);
			}
			
			stateArray = null;
			
			currentState = null;
			
			globalState = null;
		}
		
		//getter setter
		public function setGlobalState(state:BaseState):void
		{
			globalState = state;
		}
		
		public function getCurrentState():BaseState
		{
			return currentState;
		}
		
		public function getState(name:String):BaseState
		{
			for (var i:int = 0; i < stateArray.length; i++)
			{
				if (stateArray[i].getName() == name)
				{
					return stateArray[i];
				}
			}
			
			return null;
		}
	}
}