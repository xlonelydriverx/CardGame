/**
 * Data:
 * Author:
 */

package ultilities
{
	import flash.display.Shape;

	public class RectangleStyle extends ShapeStyle
	{
		
		
		//*****************************
		// Class variables
		//*****************************

		//*****************************
		// Public variables
		//*****************************
		public var dimension:Dimension;
		
		//*****************************
		// Constructor
		//*****************************
		
		public function RectangleStyle($dimension:Dimension, $color:uint, $alpha:Number = 1.0)
		{
			super($color, $alpha);
			dimension = $dimension;
		}
		

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
		
		
	}
}

