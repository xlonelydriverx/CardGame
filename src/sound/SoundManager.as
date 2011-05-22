/**
 * Data:
 * Author:
 */

package sound
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;

	public class SoundManager
	{
		
		
		//*****************************
		// Class variables
		//*****************************
		public static var BACKGROUND_MUSIC:String = "asset/soundAsset/01.mp3";
		public static var BACKGROUND_MUSIC_INSTRUMENTAL:String = "asset/soundAsset/05.mp3";
		
		//*****************************
		// Public variables
		//*****************************
		
		
		//*****************************
		// Constructor
		//*****************************
		
		public function SoundManager()
		{
			
		}
		
		//*****************************
		// Private variables
		//*****************************
		private static var _musicClip:Sound;
		private static var _sndChannel:SoundChannel;
		public static var currentSong:String;
		//*****************************
		// Public functions
		//*****************************

		public static function loadMusic(url:String):void
		{
			if(_sndChannel != null)
			{
				_sndChannel.stop();
				_sndChannel = null;
			}
			//Create an instance of the Sound class
			_musicClip=new Sound();
			//Create a new SoundChannel Object
			_sndChannel=new SoundChannel();
			//Load sound using URLRequest
			_musicClip.load(new URLRequest(url));
			//Create an event listener that wll update once sound has finished loading
			_musicClip.addEventListener(Event.COMPLETE,onComplete,false,0,true);
			function onComplete(evt:Event):void {
				//Play loaded sound
				_musicClip.removeEventListener(Event.COMPLETE,onComplete);
				_sndChannel=_musicClip.play();
				currentSong = url;
			}
		}
		
		//*****************************
		// Event functions
		//*****************************
		
		
		//*****************************
		// Private/Protected functions
		//*****************************
		
		
	}
}

