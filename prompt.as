package  {
	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.easing.*
	import fl.transitions.TweenEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	public class prompt extends MovieClip{
		public var parent_:MovieClip;
		public var mc:MovieClip
		public var _prompt:MovieClip
		public var tween:Tween;
		public var tween2:Tween;
		public var timer:Timer;
		public var timer2:Timer;
		public var fing:MovieClip;
		
		public function prompt(pass1:MovieClip,pass2:int,pass3:Number,pass4:Number) {
			// constructor code
			parent_=pass1
			mc=new MovieClip()
			//bg.mouseEnabled=true
			switch(pass2){
				case 1:_prompt=new 提示11();break;
				case 2:_prompt=new 提示12();break;
				case 3:_prompt=new 提示13();break;
				case 4:_prompt=new 提示14();break;
				case 5:_prompt=new 提示15();break;
				case 6:_prompt=new 提示16();break;
				case 7:_prompt=new 提示17();break;
				case 8:_prompt=new 提示18();break;
			}
			_prompt.x=pass3
			_prompt.y=pass4
			mc.addChild(_prompt)
			if(pass2==2){
				fing=new 提示10()
				fing.x=pass3
				fing.y=pass4
				mc.addChild(fing)
			}
			parent_._prompt=mc
			//parent_.addChild(bg)
			tween=new Tween(mc,"alpha",None.easeIn,0,1,0.8,true)
			tween.addEventListener(TweenEvent.MOTION_FINISH,keep)
			
		}
		public function keep(e:TweenEvent){
			timer=new Timer(4000,1)
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,drop)
			timer.start()
		}
		public function drop(e:TimerEvent){
			tween2=new Tween(mc,"alpha",None.easeIn,1,0,0.8,true)
			tween2.addEventListener(TweenEvent.MOTION_FINISH,die)
		}
		public function die(e:TweenEvent){
			timer2=new Timer(1000,1)
			timer2.addEventListener(TimerEvent.TIMER_COMPLETE,die2)
			timer2.start()
		}
		public function die2(e:TimerEvent){
			parent_.removeChild(parent_._prompt)
			parent_._prompt=null
			mc.removeChild(_prompt)
			_prompt=null
			if(fing){
				mc.removeChild(fing)
				fing=null
			}
			mc=null
			delete this
		}
	}
	
}
