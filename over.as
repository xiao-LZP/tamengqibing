package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	
	
	public class over extends MovieClip {
		public var _main:main;
		public var chang_level:SimpleButton;
		public var again:SimpleButton;
		public var home:SimpleButton;
		public var txt:TextField;
		
		
		public function over(pass:main) {
			// constructor code
			_main=pass;
			
			chang_level.addEventListener(MouseEvent.CLICK,_chang_level)
			again.addEventListener(MouseEvent.CLICK,_again)
			home.addEventListener(MouseEvent.CLICK,_home)
		}
		public function _chang_level(e:MouseEvent){
			//_main.clean_over()
			_main.show_level()
		}
		public function _again(e:MouseEvent){
			_main.clean_to_game()
			_main.startgame("no"+_main.current_level)
		}
		public function _home(e:MouseEvent){
			_main.clean_to_game()
			_main.show_menu()
		}
	}
	
}
