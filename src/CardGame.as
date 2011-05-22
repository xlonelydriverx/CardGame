/**
 * Data:
 * Author:
 */

package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.osmf.audio.AudioElement;
	
	import sound.SoundManager;
	
	import ultilities.Dimension;
	import ultilities.DrawShape;
	import ultilities.RectangleStyle;
	import ultilities.UIElement;
	import ultilities.UILoader;
	
	
	public class CardGame extends Sprite
	{
		private var _smallEgg:UILoader;
		private var _hatchedEgg:UILoader;
		
		private static const SPEED:Number = 0.05;
		private static const EXPANDED_MAX_SIZE:Number = 2;
		
		public function CardGame()
		{
			_smallEgg = new UILoader("img/green_egg_big.png");
			_smallEgg.buttonMode = false;
			_smallEgg.onComplete = smallEggPosition();
			addChild(_smallEgg);
			_smallEgg.addEventListener(MouseEvent.CLICK, smallEggOnClick);
			
			function smallEggPosition(e:Event = null):void
			{
				positionEgg(_smallEgg);
				_smallEgg.visible = true;
			}
			_hatchedEgg = new UILoader("img/green_egg_hatch.png");
			_hatchedEgg.visible = false;
			_hatchedEgg.addEventListener(MouseEvent.CLICK, addMusic);
			addChild(_hatchedEgg);
			addEventListener(Event.ENTER_FRAME, growEgg);
		}
		private function smallEggOnClick(e:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, growEgg);
			removeEventListener(Event.ENTER_FRAME, strinkEgg);
			_hatchedEgg.scaleX = _hatchedEgg.scaleY = _smallEgg.scaleX;

			_smallEgg.destruct();
			_smallEgg = null;
			
			_hatchedEgg.visible = true;
			positionEgg(_hatchedEgg);
		}
		
		private function addMusic(e:Event = null):void	
		{
			var musicUrl:String;
			if(SoundManager.currentSong == SoundManager.BACKGROUND_MUSIC)
				musicUrl = SoundManager.BACKGROUND_MUSIC_INSTRUMENTAL;
			else
				musicUrl = SoundManager.BACKGROUND_MUSIC;
			SoundManager.loadMusic(musicUrl);
		}
		private function growEgg(e:Event):void
		{
			_smallEgg.scaleX += SPEED;
			_smallEgg.scaleY += SPEED;
			positionEgg(_smallEgg);
			if(_smallEgg.scaleX >= EXPANDED_MAX_SIZE)
			{
				removeEventListener(Event.ENTER_FRAME, growEgg);
				addEventListener(Event.ENTER_FRAME, strinkEgg);
			}
		}
		private function positionEgg(element:UIElement):void
		{
			element.x = (stage.stageWidth - element.width) * 0.5;
			element.y = (stage.stageHeight - element.height) * 0.5;
		}
		private function strinkEgg(e:Event):void
		{
			_smallEgg.scaleX -= SPEED;
			_smallEgg.scaleY -= SPEED;
			positionEgg(_smallEgg);
			if(_smallEgg.scaleX <= 1.0)
			{
				removeEventListener(Event.ENTER_FRAME, strinkEgg);
				addEventListener(Event.ENTER_FRAME, growEgg);
			}
			
		}
	}
}