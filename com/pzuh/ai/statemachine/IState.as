package com.pzuh.ai.statemachine
{
	public interface IState 
	{
		function enter():void;
		function update():void;
		function exit():void;
	}	
}