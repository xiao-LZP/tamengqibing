package  {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	
	public class help extends MovieClip {
		public var _main:main
		public var back_button:SimpleButton;
		
		public function help(pass:main) {
			// constructor code
			_main=pass;
			back_button.addEventListener(MouseEvent.CLICK,_back)
		}
		public function _back(e:MouseEvent){
			_main.clean_help()
		}
	}
	
}
