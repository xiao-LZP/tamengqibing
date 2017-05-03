package  {
	
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	
	public class chang_level extends Sprite {
		public var _main:main;
		public var back_button:SimpleButton;
		public var no1:SimpleButton;
		public var no2:SimpleButton;
		public var no3:SimpleButton;
		
		public function chang_level(pass:main) {
			// constructor code
			_main=pass
			//bg.alpha=0.5
			back_button.addEventListener(MouseEvent.CLICK,close_event)
			for(var i:int=1;i<4;i++){
				this["no"+i].addEventListener(MouseEvent.CLICK,start_game)
			}
		}
		public function close_event(e:MouseEvent){
			_main.clean_chang_level()
		}
		public function start_game(e:MouseEvent){
			_main.clean_to_game()
			_main.startgame(e.target.name)
		}
	}
	
}
