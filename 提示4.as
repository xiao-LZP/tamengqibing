package  {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.MouseEvent;
	
	public class 提示4 extends MovieClip {
		public var exit:SimpleButton
		public var _main:main
		
		public function 提示4(pass:main) {
			// constructor code
			_main=pass
			exit.addEventListener(MouseEvent.CLICK,_exit)
		}


		public function _exit(e:MouseEvent){
			_main.clean_regular()
		}
	}
	
}
