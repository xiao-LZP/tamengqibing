package  {
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	
	
	public class star_anim extends MovieClip {
		public var _main:main;
		//public var aa:bg_music01;
		
		public function star_anim(pass:main) {
			// constructor code
			_main=pass
			this.addEventListener(Event.ADDED_TO_STAGE,_add)
		}
		public function _add(e:Event){
			//aa=new bg_music01()
			//aa.play()
			stage.stageFocusRect=false
			stage.focus=this;
			stage.addEventListener(KeyboardEvent.KEY_DOWN,_key)
			this.addEventListener(Event.ENTER_FRAME,_frame)
		}
		public function _key(e:KeyboardEvent){
			if(e.keyCode==27 || e.keyCode ==13 ||32){
				clean()
		}
	}
		public function _frame(e:Event){
			if(this.currentFrame==this.totalFrames){
				clean()
			}
		}
		public function clean(){
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,_key)
			this.removeEventListener(Event.ENTER_FRAME,_frame)
			_main.clean_star_anim()
			_main.show_menu()
		}
	
}
}