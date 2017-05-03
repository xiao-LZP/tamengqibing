package com{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.events.MouseEvent;


	public class 鲸鱼 extends MovieClip {

		public var enemy:MovieClip;
		public var num:int=0;
		public var speed:Number=10
		public var speed2:Number=18
		public var fangwei:Number=120
		public var shanghai:Number=1.2
		public var hp:int=30
		public var guai_array:Array=new Array()
		public var current_level:int=1
		public var total_level:int=5
		public var hp_arr:Array=[10,15,22,30]
		public var scale:Number=1
		//public var apeed:Number=1.5
		public var boo:Boolean
		
		public function 鲸鱼() {
			addEventListener(Event.ENTER_FRAME,repeat);
			this.addEventListener(MouseEvent.MOUSE_DOWN,level)
		}
		public function setEnemy(pass:Array){
			//enemy=pass[0]
				boo=false
				pass.sortOn("distance",Array.NUMERIC)
				for(var i:int=pass.length-1;i>=0;i--){
					if(pass[i].currentFrame!=17){
						enemy=pass[i]
						boo=true
						break
					}
				}
				if(!boo)
				enemy=null
		}
		public function repeat(e:Event) {
			if (enemy==null) {
				return;
			}
			var deltaX = enemy.x-this.x
			var deltaY = enemy.y-this.y
			var theta =Math.atan2(deltaY,deltaX);			
			
			num++
			if (num%speed == 0 ) {
				var bullet=new column();
				var point=new Point(this.x,this.y);
				bullet.dx =point.x;
				bullet.dy =point.y;
				bullet.x =point.x;
				bullet.y =point.y;
				bullet.fangwei=fangwei
				bullet.shanghai=shanghai
				bullet.scale=scale
				//bullet.apeed=apeed
				
				bullet.setSpeed(theta,speed2);
				bullet.setEnemy(enemy);
				bullet.guai_array=guai_array
				parent.addChild(bullet);
				//var s = new ShootSound();
				//s.play();
			}
		}
	public function level(e:MouseEvent){
		if(MovieClip(parent).hp<hp_arr[current_level-1]){
			var _meFailSound=new meFailSound()
			_meFailSound.play()
			var pp:PointBurst = new PointBurst( MovieClip(parent),"HP值不够!",this.x,this.y,2);
		}
		if(current_level<=total_level && MovieClip(parent).hp>hp_arr[current_level-1]){
			current_level++;
			MovieClip(parent).hp-=hp_arr[current_level-2];
			fangwei+=15
			//apeed+=0.3
			speed-=0.5
			shanghai+=0.5
			scale+=0.05
			speed2+=2
			//this.scaleX+=0.5
			//trace("1")
			var _meSuccessSound=new meSuccessSound()
			_meSuccessSound.play()
			var pb:PointBurst = new PointBurst( MovieClip(parent),"升级成功!",this.x,this.y);
			if(current_level==total_level){
				this.gotoAndStop(2)
				this.buttonMode=false;
				this.removeEventListener(MouseEvent.CLICK,level)
			}
		}
	}
	public function remove_this(){
		removeEventListener(Event.ENTER_FRAME,repeat);
		this.removeEventListener(MouseEvent.MOUSE_DOWN,level)
	}
	}
}