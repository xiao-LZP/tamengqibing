package com
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class 筷子怪 extends MovieClip
	{
		public var pathArr:Array
		public var speed:Number;
		public var vx:Number;
		public var vy:Number;
		public var stepCount:int = 0;
		public var passedDot:Boolean = true;
		public var currentIndex:int = 0;
		public var num:int;
		public var _shengmingzhi:Number;
		public var max_shengmingzhi:Number;
		public var max_speed:Number
		public var recover:Number=0.005
		public var num1:Number;
		public var _min:Number;
		public var _max:Number;
		public var lei:String="可回收物桶"
		public var dx:Number;
		public var dy:Number
		public var dis:Number
		public var boo:Boolean=true
		public var die:Boolean=true
		
		public var oldx:Number
		public var oldy:Number
		public var distance:Number=0
		public var reborn:Number
		public var reborn_timer:Timer
		public var drag:Boolean=false
		
		public function 筷子怪()
		{
			// constructor code
		}
		public function set_pathArr(pass:Array){
			pathArr=new Array();
			pathArr=pass;
			this.x = Dot(pathArr[0]).dx;
			this.y = Dot(pathArr[0]).dy;
			oldx = Dot(pathArr[0]).dx;
			oldy = Dot(pathArr[0]).dy;
			num = pathArr.length
			this.addEventListener(Event.ENTER_FRAME, onEnterFm);
			num1=Math.floor(Math.random()*10)
			this.mouseEnabled=false
		}
		public function onEnterFm(e:Event):void
		{	
			if(speed<max_speed)
			speed+=recover
			else if(speed>max_speed)
			speed=max_speed
			
			this.mc.scaleX=_shengmingzhi/max_shengmingzhi
			if (passedDot)
			{
				if (currentIndex < num - 1)
				{
					var deltaY:Number = Dot(pathArr[currentIndex + 1]).dy - Dot(pathArr[currentIndex]).dy;
					var deltaX:Number = Dot(pathArr[currentIndex + 1]).dx - Dot(pathArr[currentIndex]).dx;
					var angle:Number = Math.atan2(deltaY,deltaX);
					(angle * 180 / Math.PI>=180)?this.scaleX=-1:this.scaleX=1
					this.rotation = (angle * (180 / Math.PI))%180;
					vx = Math.cos(angle);
					vy = Math.sin(angle);
					dis= Math.sqrt(deltaY*deltaY+deltaX*deltaX);
				}
				passedDot = false;
			}
			if (stepCount < dis)
			{
				this.x +=  (vx * speed);
				this.y +=  (vy * speed);
				distance+=Math.abs(this.x-oldx)+Math.abs(this.y-oldy)
				oldx=this.x
				oldy=this.y
				var a:Number=this.x-Dot(pathArr[currentIndex]).dx;
				var b:Number=this.y-Dot(pathArr[currentIndex]).dy;
				stepCount=Math.sqrt(a*a+b*b)
			}
			else
			{
				if (currentIndex < num - 1)
				{
					currentIndex++;
					stepCount = 0;
					passedDot = true;
					this.x = Dot(pathArr[currentIndex]).dx;
					this.y = Dot(pathArr[currentIndex]).dy;
				}
				if(currentIndex >= num - 1){
					MovieClip(parent).set_guai_win()
					deleteBullet()
				}
			}
	
			if ((this._shengmingzhi <= 0) && (!((num1>_min) && (num1<=_max))) ){
				deleteBullet();
			}
			else if((this._shengmingzhi <= 0) && (num1>_min) && (num1<=_max)){
				this.gotoAndStop(17)
				this.mouseEnabled=true
				this.buttonMode=true
				MovieClip(parent).garde+=int(max_speed*2+max_shengmingzhi/5)
				reborn_timer=new Timer(reborn,1)
				reborn_timer.addEventListener(TimerEvent.TIMER_COMPLETE,reborn_event)
				reborn_timer.start()
				this.addEventListener(MouseEvent.MOUSE_DOWN,_down)
				this.removeEventListener(Event.ENTER_FRAME,onEnterFm);
				var _rubbishSound=new rubbishSound()
				_rubbishSound.play()
			}
		}	
			public function reborn_event(e:TimerEvent){
				speed+=1
				max_speed+=1
				_shengmingzhi=max_shengmingzhi*2
				max_shengmingzhi=max_shengmingzhi*2
				num1=Math.floor(Math.random()*10)
				this.addEventListener(Event.ENTER_FRAME,check_drag)
			}
			public function check_drag(e:Event){
				if(drag==false){
					this.gotoAndPlay(1)
					this.mouseEnabled=false
					this.buttonMode=false
					var _rebortSound=new rebortSound()
					_rebortSound.play()
					this.addEventListener(Event.ENTER_FRAME, onEnterFm);
					this.removeEventListener(Event.ENTER_FRAME,check_drag)
					this.removeEventListener(MouseEvent.MOUSE_DOWN,_down)
				}
			}
			public function _down(e:MouseEvent){
				dx=e.stageX;
				dy=e.stageY
				drag=true
				this.addEventListener(Event.ENTER_FRAME,_move)
			}
			public function _move(e:Event){
				if(boo){
					MovieClip(parent).addEventListener(MouseEvent.MOUSE_UP,_up)
					stage.addEventListener(Event.MOUSE_LEAVE,leave)
					boo=false
				}
				this.x=stage.mouseX
				this.y=stage.mouseY
			}
			public function leave(e:Event){
				this.removeEventListener(Event.ENTER_FRAME,_move)
				MovieClip(parent).removeEventListener(MouseEvent.MOUSE_UP,_up)
				stage.removeEventListener(Event.MOUSE_LEAVE,leave)
				this.x=dx
				this.y=dy
				drag=false
				boo=true
			}
			public function _up(e:MouseEvent){
				this.removeEventListener(Event.ENTER_FRAME,_move)
				MovieClip(parent).removeEventListener(MouseEvent.MOUSE_UP,_up)
				stage.removeEventListener(Event.MOUSE_LEAVE,leave)
				if(this.hitTestObject(MovieClip(parent).game.getChildByName("厨房垃圾桶")) || this.hitTestObject(MovieClip(parent).game.getChildByName("有害垃圾桶")) || this.hitTestObject(MovieClip(parent).game.getChildByName("可回收物桶")) || this.hitTestObject(MovieClip(parent).game.getChildByName("其他垃圾桶"))){
					if(this.hitTestObject(MovieClip(parent).game.getChildByName(lei))){
						MovieClip(parent).garde+=10
						var pb:PointBurst = new PointBurst( MovieClip(parent),"+ 10!",this.x,this.y);
						var _rightSound=new rightSound()
						_rightSound.play()
				}
					else{
						MovieClip(parent).garde-=10
						var pp:PointBurst = new PointBurst( MovieClip(parent),"- 10!",this.x,this.y,2);
						var _errorSound=new errorSound()
						_errorSound.play()
					}
					this.removeEventListener(MouseEvent.MOUSE_DOWN,_down)
					MovieClip(parent).removeBullet(this);
					parent.removeChild(this);
				}
				else{
					this.x=dx
					this.y=dy
					boo=true
					drag=false
				}
			}
			public function deleteBullet() {
				if(die){
					MovieClip(parent).garde+=int(max_speed*2+max_shengmingzhi/5)
					MovieClip(parent).removeBullet(this);
					parent.removeChild(this);
					this.removeEventListener(Event.ENTER_FRAME,onEnterFm);
					die=false
					if(this._shengmingzhi <= 0){
					var _dieSound=new dieSound()
					_dieSound.play()
					}
				}
		}
	}

}