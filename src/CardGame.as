/**
 * Data:
 * Author:
 */

package
{
	import flash.display.Sprite;
	
	import ultilities.Dimension;
	import ultilities.DrawShape;
	import ultilities.RectangleStyle;
	import ultilities.UIElement;
	
	
	public class CardGame extends Sprite
	{
		private var _rectangle:UIElement;
		public function CardGame()
		{
			_rectangle = new UIElement();
			
			var rectStyle:RectangleStyle = new RectangleStyle(new Dimension(100,100), 0x0);
			DrawShape.drawSquare(_rectangle.graphics, rectStyle);
			addChild(_rectangle);
			
		}
	}
}