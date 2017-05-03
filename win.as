package  {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	
	
	public class win extends MovieClip {
		public var _main:main;
		public var next_level:MovieClip;
		public var exit:SimpleButton;
		public var txt:TextField;
		
		public function win(pass:main) {
			// constructor code
			_main=pass
			_set()
			next_level.addEventListener(MouseEvent.CLICK,_next_level)
			exit.addEventListener(MouseEvent.CLICK,_exit)
			
			
		}
		public function _set(){
			if(_main.current_level==3){
				next_level.alpha=0.3
				next_level.buttonMode=false
			}
			if(_main.current_level<3){
				next_level.alpha=1
				next_level.buttonMode=true
			}
		}
		public function _next_level(e:MouseEvent){
			if(_main.current_level<3){
			_main.clean_to_game()
			_main.startgame("no"+(_main.current_level+1))
			}
			
		}
		public function _exit(e:MouseEvent){
			_main.clean_to_game()
			_main.show_menu()
		}
	}
	
}
