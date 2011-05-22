/**
 * Data:
 * Author:
 */

package ultilities
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;

	public class UILoader extends UIElement
	{
		
		
		//*****************************
		// Class variables
		//*****************************
		
		
		//*****************************
		// Public variables
		//*****************************
		
		
		//*****************************
		// Constructor
		//*****************************
		
		public function UILoader(url:String)
		{
			super();
			_url = url;
		}
		
		//*****************************
		// Private variables
		//*****************************
		private var _loader:Loader;
		private var _url:String;
		public var onComplete:Function;
		//*****************************
		// Public functions
		//*****************************
		
		
		//*****************************
		// Event functions
		//*****************************
		
		
		//*****************************
		// Private/Protected functions
		//*****************************
		protected override function init(e:Event=null):void
		{
			super.init(e);
			var request:URLRequest = new URLRequest(_url);
			//var context:LoaderContext = new LoaderContext();
			_loader = new Loader();
			_loader.load(request);
			addChild(_loader);
			_loader.addEventListener(Event.ENTER_FRAME, onFrame);
		}
		private function onFrame(e:Event):void
		{
			if(_loader.loaderInfo.bytesLoaded >= _loader.loaderInfo.bytesTotal)
			{
				_loader.removeEventListener(Event.ENTER_FRAME, onFrame);
				if(onComplete != null)
					onComplete(e);
			}
				
		}
		public override function destruct():void
		{
			_loader.unload();
			_loader = null;
			super.destruct();
		}
		
	}
}

