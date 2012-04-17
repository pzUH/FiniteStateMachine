package entities 
{
	public class BaseEntity
	{
		protected var name:String;
		
		protected var curLoc:String;		
		
		protected var energy:int;
		protected const maxEnergy:int = 20;
		
		protected var thirst:int;
		protected const maxThirst:int = 10;
		
		public function BaseEntity(name:String) 
		{
			this.name = name;
			
			curLoc = Miner.HOME;
			energy = maxEnergy;
			thirst = 0;
		}	
		
		public function update():void
		{
			
		}
		
		public function isTired():Boolean
		{
			var temp:Boolean;
			
			if (energy <= 0)
			{
				temp = true;
			}
			else
			{
				temp = false;
			}
			
			return temp;
		}
		
		public function isFullyRested():Boolean
		{
			var temp:Boolean;
			
			if (energy >= maxEnergy)
			{
				temp = true;
			}
			else
			{
				temp = false;
			}
			
			return temp;
		}
		
		public function isThirsty():Boolean
		{
			var temp:Boolean;
			
			if (thirst >= maxThirst)
			{
				temp = true;
			}
			else
			{
				temp = false;
			}
			
			return temp;
		}
		
		public function isNotThirsty():Boolean
		{
			var temp:Boolean;
			
			if (thirst <= 0)
			{
				temp = true;
			}
			else
			{
				temp = false;
			}
			
			return temp;
		}
		
		public function increaseEnergy():void
		{
			energy += 2;
		}
		
		public function decreaseEnergy():void
		{
			energy--;
		}
		
		public function increaseThirst():void
		{
			thirst++;
		}
		
		public function decreaseThirst():void
		{
			thirst -= 2;
		}
		
		//getter setter
		public function getEnergy():int
		{
			return energy;
		}
		
		public function getThirst():int
		{
			return thirst;
		}
		
		public function getLoc():String
		{
			return curLoc;
		}
		
		public function setLoc(val:String):void
		{
			curLoc = val;
		}
		
		public function getName():String
		{
			return name;
		}
	}
}