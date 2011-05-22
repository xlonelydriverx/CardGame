/**
 * Data:
 * Author:
 */

package ultilities
{
	import flash.display.Graphics;

	public class DrawShape
	{
		
		
		//*****************************
		// Class variables
		//*****************************
		
		
		//*****************************
		// Constructor
		//*****************************
		
		public function DrawShape()
		{
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
		public static function drawSquare(g:Graphics, style:RectangleStyle):void
		{
			g.beginFill(style.color, style.alpha);
			g.drawRect(0, 0, style.dimension.width, style.dimension.height);
			g.endFill();
		}
		
		//*****************************
		// Event functions
		//*****************************
		
		
		//*****************************
		// Private/Protected functions
		//*****************************
		
		
	}
}

