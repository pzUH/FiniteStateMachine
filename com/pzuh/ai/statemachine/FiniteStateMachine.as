package com.pzuh.ai.statemachine
{	
	public class FiniteStateMachine
	{
		private var currentState:IState;
		
		//global state: a state to control transition for multiple states which have same transition to several target states
		//just a hack if you didn't want to implement a Hierarchical State Machine
		private var globalState:IState;
		
		public function FiniteStateMachine() 
		{
			currentState = null;
			globalState = null;
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
		
		public function changeState(state:IState):void
		{
			if (currentState != null) 
			{
				currentState.exit();
			}
			
			currentState = state;
			currentState.enter();
		}
		
		//getter setter
		public function setGlobalState(state:IState):void
		{
			globalState = state;
		}
		
		public function getCurrentState():IState
		{
			return currentState;
		}
	}
}