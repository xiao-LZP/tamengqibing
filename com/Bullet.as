package com{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	public class Bullet extends MovieClip {
		public var speedx:Number, speedy:Number;
		public var radio:Number;
		public var enemy:MovieClip;
		public var dx:Number
		public var dy:Number
		public var fangwei:Number;
		public var shanghai:Number
		public var apeed:Number
		public var boo:Boolean=true;
		public var guai_array:Array=new Array()
		public var scale:Number
		
		public function Bullet() {
			radio= this.width/2;
			this.mouseEnabled=false
			addEventListener(Event.ENTER_FRAME,repeat);
		}
		public function repeat(Event) {
			moveBall();
			var deadHero = checkBomb();
			if (deadHero != null) {
				//var s=new BombSound();
				//s.play();
				bombEndHandler()
			}
		}
		public function bombEndHandler() {
			if(boo){
			removeEventListener(Event.ENTER_FRAME,repeat);
			parent.removeChild(this);
			boo=false
			}
		}
		public function moveBall() {
			var newx = this.x+speedx;
			var newy = this.y+speedy;
			
			var a:Number=dx-newx
			var b:Number=dy-newy
			var far:Number=Math.sqrt(a*a+b*b)
			
			if(far>=fangwei&&boo){
				removeEventListener(Event.ENTER_FRAME,repeat);
				parent.removeChild(this);
				boo=false
				return;
			}
			else{
				this.x = newx;
				this.y = newy;
				this.scaleX=this.scaleY=scale
			}
			
		}
		public function setEnemy(enemyName:MovieClip) {
			enemy=enemyName;
		}
		public function setSpeed(jiaodu:Number,speed:Number):void {
			speedx = speed*Math.cos(jiaodu);
			speedy = speed*Math.sin(jiaodu);
		}
		public function checkBomb():MovieClip {
				for(var i:int=0;i<guai_array.length;i++){
					if(guai_array[i] is road)
					return null
					if (guai_array[i].hitTestPoint(this.x, this.y, true) ) {
					guai_array[i]._shengmingzhi-=shanghai
					return guai_array[i];
				}
				}
			return null;
		}
	}
}