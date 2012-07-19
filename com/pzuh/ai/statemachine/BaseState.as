package com.pzuh.ai.statemachine
{
	public class BaseState
	{
		protected var myEntity:Object;
		
		protected var name:String;
		
		protected var transitionArray:Array;
		
		protected var action:Object;
		
		public function BaseState(entity:Object, name:String)
		{
			myEntity = entity;
			
			this.name = name;
			
			transitionArray = new Array();
			
			action = new Object();
		}
		
		public function addAction(update:Function, enter:Function = null, exit:Function = null) :void
		{
			action.update = update;
			action.enter = enter;
			action.exit = exit;
		}
		
		public function addTransition(targetState:String, trigger:Function):void
		{
			var transitionObject:Object = new Object();
			transitionObject.targetState = targetState;
			transitionObject.trigger = trigger;
			
			if (transitionArray.indexOf(transitionObject) == -1)
			{
				transitionArray.push(transitionObject);
			}
		}
		
		public function removeSelf():void
		{
			if (transitionArray.length > 0) 
			{
				for (var i:int = transitionArray.length - 1; i >= 0; i--)
				{
					transitionArray.splice(i, 1);
				}
			}
			
			transitionArray = null;
			
			myEntity = null;
			
			action = null;
		}
		
		public function getName():String
		{
			return name;
		}
		
		public function enter():void
		{
			if (action.enter != null)
			{
				action.enter.apply();
			}
		}
		
		public function update():void
		{
			if (transitionArray.length > 0)
			{
				for (var i:int = 0; i < transitionArray.length; i++)
				{
					if (transitionArray[i].trigger.apply() == true)
					{
						myEntity.changeState(transitionArray[i].targetState);
						
						return;
					}
				}
			}
			
			if (action.update != null)
			{
				action.update.apply();
			}
		}
		
		public function exit():void
		{
			if (action.exit != null)
			{
				action.exit.apply();
			}
		}
	}
}