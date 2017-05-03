package  {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	
	public class about extends MovieClip {
		public var _main:main
		public var back:SimpleButton
		
		public function about(pass:main) {
			// constructor code
			_main=pass;
			back.addEventListener(MouseEvent.CLICK,_back)
		}
		public function _back(e:MouseEvent){
			_main.clean_about()
		}
	}
	
}
