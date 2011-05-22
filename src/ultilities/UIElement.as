/**
 * Data:
 * Author:
 */

package ultilities
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class UIElement extends Sprite
	{
		
		
		//*****************************
		// Class variables
		//*****************************
		
		
		//*****************************
		// Constructor
		//*****************************
		
		public function UIElement()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		//*****************************
		// Public variables
		//*****************************
		
		//*****************************
		// Private variables
		//*****************************
		
		//*****************************
		// Public functions
		//*****************************
		
		//*****************************
		// Event functions
		//*****************************
		
		//*****************************
		// Private/Protected functions
		//*****************************
		protected function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function destruct():void
		{
			this.graphics.clear();
			if(parent != null && parent.contains(this))
			{
				parent.removeChild(this);
			}

		}
	}
}

