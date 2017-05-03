package  {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import fl.transitions.TransitionManager;
	import fl.transitions.*;
	import flash.events.Event;
	
	
	public class menu extends MovieClip {
		public var _main:main;
		public var start_game:SimpleButton;
		public var set_up:SimpleButton;
		public var help:SimpleButton;
		public var about:SimpleButton
		public var biaoti:MovieClip;
		public var timer:Timer=new Timer(8000)
		public var tr:TransitionManager
		
		
		public function menu(pass:main) {
			// constructor code
			addEventListener(Event.ADDED_TO_STAGE,add_event)
			_main=pass
		}
		public function add_event(e:Event){
			biaoti.buttonMode=true
			var tr:TransitionManager=new TransitionManager(biaoti)
			tr.startTransition({type:PixelDissolve,duration:4})
			timer.addEventListener(TimerEvent.TIMER,timer_function)
			timer.start()
			start_game.addEventListener(MouseEvent.CLICK,click_start_game)
			set_up.addEventListener(MouseEvent.CLICK,click_set_up)
			help.addEventListener(MouseEvent.CLICK,click_help)
			about.addEventListener(MouseEvent.CLICK,click_about)
			biaoti.addEventListener(MouseEvent.CLICK,show_star_anim)
		}
		public function timer_function(e:TimerEvent){
			tr=new TransitionManager(biaoti)
			tr.startTransition({type:PixelDissolve,duration:4})
		}
		public function click_start_game(e:MouseEvent){
			_main.show_level()
		}
		public function click_set_up(e:MouseEvent){
			_main.show_bgmusic_setup()
		}
		public function click_help(e:MouseEvent){
			_main.show_help()
		}
		public function click_about(e:MouseEvent){
			_main.show_about()
		}
		public function show_star_anim(e:MouseEvent){
			_main.clean_to_game()
			_main.show_star_anim()
		}
	}
	
}
