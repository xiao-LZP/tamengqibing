package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.SimpleButton;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import flash.events.ContextMenuEvent;
	import com.*;
	
	public class thegame extends MovieClip {
		public var _main:main;
		//public var exit:SimpleButton;
		public var game:MovieClip;
		public var jiance:MovieClip;
		public var du_array:Array;
		public var guai_array:Array;
		public var me_array:Array;
		public var ti,ti2,ti3:Timer;
		public var current:int=0;
		public var total:int;
		public var me_num:int=5;
		public var me_change:MovieClip;
		public var change_boolean:Boolean=false;
		public var dx:Number;
		public var dy:Number;
		public var guai_speed:Number
		public var guai_xue:Number
		public var guai_time:Number=2000
		public var guai_num:int
		public var guai_chunxu:Array
		public var guai_fangwei:Array
		public var time:int=0
		public var guai_win:Number=0
		public var current_level:int;
		public var hp:int=0
		public var a:int
		public var success_level:Array;
		public var garde:Number=0;
		public var _prompt:MovieClip
		public var _introduce:MovieClip
		public var myContextMenu:ContextMenu;
		public var item_remove:ContextMenuItem;
		public var prompt_arr:Array
		public var guai_num_arr:Array=[ [2,3,3,5,5,7,7,9,9,10],
									   [2,3,3,5,5,7,7,9,9,11,11,13,13,15,15],
									   [2,3,3,5,5,7,7,9,9,11,11,13,13,15,15,17,17,19,19,20]
									   ]
		public var guai_speed_arr:Array=[ [1.0,1.2,1.4,1.6,1.8,2.0,2.2,2.4,2.6,2.8],
										 [1.0,1.2,1.4,1.6,1.8,2.0,2.1,2.2,2.3,2.4,2.5,2.6,2.7,3.0,3.2],
										 [1.0,1.1,1.2,1.3,1.4,1.5,1.7,1.9,2.1,2.3,2.5,2.7,2.9,3.1,3.3,3.5,3.6,3.7,3.8,4.0]
										 ]
		public var guai_shengming_arr:Array=[ [5.0,5.2,5.4,5.6,5.8,6.0,6.2,6.4,6.6,6.8],
											 [6.0,6.2,6.4,6.6,6.8,7.0,7.2,7.4,7.6,7.8,8.0,8.2,8.4,8.6,8.8],
											 [8.0,8.2,8.4,8.6,8.8,9.0,9.2,9.4,9.6,9.8,10,10.2,10.4,10.6,10.8,11,11.2,11.4,11.6,11.8]
											 ]
		public var min_max_array:Array=[ [1,2],	[1,3], [1,3] ]
		public var max_go:Array=[ [5],[5],[5] ]
		public var rebort_array=[ [10000],[8000],[7000] ]
		public var pathArr:Array = [ [new Dot(200,170),new Dot(640,170),new Dot(640,495),new Dot(640,495),new Dot(200,495)],
									[new Dot(45,190),new Dot(155,190),new Dot(155,410),new Dot(475,410),new Dot(475,225),new Dot(600,225),new Dot(600,415),new Dot(750,415)],
									[new Dot(85,390),new Dot(85,255),new Dot(320,255),new Dot(320,100),new Dot(710,100),new Dot(710,335),new Dot(400,335),new Dot(400,490),new Dot(710,490)]
									];
		
		
		public function thegame(pass:main) {
			// constructor code
			_main=pass;
			pass_level();
			this.addEventListener(Event.ADDED_TO_STAGE,_add)
		}
		public function pass_level(){
			switch(_main.current_level){
				case 1:game=new level1();addChildAt(game,0);break;
				case 2:game=new level2();addChildAt(game,0);break;
				case 3:game=new level3();addChildAt(game,0);break;
			}
			current_level=_main.current_level
		}
		public function _add(e:Event){
			du_array=new Array();
			guai_array=new Array();
			me_array=new Array();
			success_level=new Array()
			guai_chunxu=new Array()
			_prompt=null
			prompt_arr=[false,false,false,false,false,false,false,false]
			success_level=_main.localdata.data.success_level
			current=0;
			total=guai_num_arr[current_level-1].length;
			time=0
			hp=15
			change_boolean=false;
			guai_win=0
			show_text()
			show_introduce()
			right()
			
			game.jiance.mouseEnabled=false
			for(var i:int=0;i<game.numChildren;i++){
				var mc=game.getChildAt(i);
				if(mc is tree1 || mc is tree2 || mc is tree3 || mc is tree4 || mc is bone1||mc is bone2||mc is bone3||mc is bone4||mc is water ||mc is road || mc is wood || mc is ship || mc is buoy || mc is bottle || mc is star || mc is rainbow || mc is house || mc is cloud || mc is balloon || mc is 有毒垃圾 || mc is 其他垃圾 || mc is 可回收物 || mc is 厨房垃圾 || mc is menpai || mc is jingling){
					du_array.push(mc);
					if(mc is road || mc is 有毒垃圾 || mc is 其他垃圾 || mc is 可回收物 || mc is 厨房垃圾 || mc is menpai || mc is jingling)
					continue
					du_array[du_array.length-1]._shengmingzhi=10
					mc.buttonMode=true
					mc.addEventListener(MouseEvent.MOUSE_DOWN,gongji)
					
				}
			}
		}
		public function right(){
			myContextMenu=new ContextMenu()
			myContextMenu.hideBuiltInItems()
			item_remove=new ContextMenuItem("删 除")
			myContextMenu.customItems.push(item_remove)
			item_remove.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,right_remove)
		}
		public function right_remove(e:ContextMenuEvent){
			me_array[me_array.indexOf(e.mouseTarget)].remove_this()
			me_array.splice(me_array.indexOf(e.mouseTarget),1)
			//trace(me_array.length)
			removeChild(e.mouseTarget)
			e.mouseTarget=null
		}
		public function game_start(){
			this.addEventListener(MouseEvent.MOUSE_DOWN,_MOUSE_DOWN)
			this.addEventListener(Event.ENTER_FRAME,_frame)
			regular.addEventListener(MouseEvent.MOUSE_DOWN,show_regular)
			exit.addEventListener(MouseEvent.MOUSE_DOWN,fail)
			startguai()
			radom()
			showtime()
		}
		public function show_introduce(){
			if(_main.localdata.data.introduce_level==0){
				game_start()
				return
			}
			else{
				switch(_main.localdata.data.introduce_level){
					case 2:_introduce=new introduce1();break;
					case 3:_introduce=new introduce2();break;
					case 4:_introduce=new introduce3();break;
				}
				if(_introduce){
				_introduce.start_button.addEventListener(MouseEvent.CLICK,close_introduce)
				_introduce.close_button.addEventListener(MouseEvent.CLICK,close_introduce)
				addChild(_introduce)
				}
			}
			_main.localdata.data.introduce_level=0
			_main.localdata.flush()
			}
		public function close_introduce(e:MouseEvent){
			_introduce.start_button.removeEventListener(MouseEvent.CLICK,close_introduce)
			_introduce.close_button.removeEventListener(MouseEvent.CLICK,close_introduce)
			removeChild(_introduce)
			_introduce=null
			game_start()
		}
		
		public function showtime(){
			ti3=new Timer(1000)
			ti3.addEventListener(TimerEvent.TIMER,time_text)
			ti3.start()
		}
		public function time_text(e:TimerEvent){
			hp++
			if(hp>50)
			hp=50
		}
		public function radom(){
			me_change=game.me_change
			addChild(me_change)
			me_change.me_change.width=Number(50*(success_level.length))
			me_change.me_change.x=-0.5*me_change.me_change.width
				
			for(var k:int=0;k<success_level.length;k++){
				var mm:MovieClip;
				switch(success_level[k]){				
					case 0:mm=new 章鱼();break;
					case 1:mm=new 海狮();break;
					case 2:mm=new 螃蟹();break;
					case 3:mm=new 海星();break;
					case 4:mm=new 鲸鱼();break;
				}
				if(success_level.length%2==0){
					mm.x=k*50-50*success_level.length/2+25
				}
				else{
					mm.x=(k-Math.floor(success_level.length/2))*50
				}
				me_change.addChild(mm);
				me_change.visible=false
				mm.buttonMode=true
				mm.addEventListener(MouseEvent.MOUSE_DOWN,new_me)
			}
		}
		public function new_me(e:MouseEvent){
			if(hp<e.target.hp){
			var pb:PointBurst = new PointBurst( MovieClip(this),"HP值不够!",e.stageX,e.stageY,2);
			var _meFailSound=new meFailSound()
			_meFailSound.play()
			return
			}
			else{
			var aa:MovieClip
			if(e.target is 章鱼)
			aa=new 章鱼()
			else if(e.target is 螃蟹)
			aa=new 螃蟹()
			else if(e.target is 鲸鱼)
			aa=new 鲸鱼()
			else if(e.target is 海星)
			aa=new 海星()
			else if(e.target is 海狮)
			aa=new 海狮()
			aa.buttonMode=true
			aa.x=dx
			aa.y=dy
			aa.contextMenu=myContextMenu
			addChild(aa)
			me_array.push(aa)
			me_change.visible=false
			change_boolean=true
			hp-=e.target.hp
			var _meSuccessSound=new meSuccessSound()
			_meSuccessSound.play()
			}
		}
		public function set_guai_win(){
			guai_win++
			game._jingling.shengming.scaleX=Number((max_go[current_level-1]-guai_win)/max_go[current_level-1])
			game._jingling.gotoAndStop(guai_win+1)
			trace(guai_win)
			if(guai_win==max_go[current_level-1]){
			fail(null)
			}
		}
		public function _MOUSE_DOWN(e:MouseEvent){
			if(game.jiance.alpha==0){
			me_change.visible=false
			change_boolean=false
			return
			}
			change_boolean=!change_boolean
			if(change_boolean){
				me_change.visible=true
				addChild(me_change)
				me_change.x=mouseX;
				me_change.y=mouseY;
				if(mouseX<0.5*me_change.width)
				me_change.x=0.5*me_change.width
				if(mouseX>800-0.5*me_change.width)
				me_change.x=800-0.5*me_change.width
				if(mouseY<50+0.5*me_change.height)
				me_change.y=50+0.5*me_change.height
				if(mouseY>600-0.5*me_change.height)
				me_change.y=600-0.5*me_change.height
				dx=mouseX;
				dy=mouseY;
			}
			else{
				me_change.visible=false
			}
		}
		public function show_prompt(){
			//_main.localdata.data.success_level.indexOf(int(current_level+2))==-1
			if(_prompt)
			return
			if(current_level==1 && (_main.localdata.data.success_level.length<=3)){
				if(!prompt_arr[2] && me_array.length>0){
					var aa:prompt=new prompt(this,3,me_array[0].x,me_array[0].y)
					prompt_arr[2]=true
					addChild(_prompt)
					return
				}
				if(!prompt_arr[3] && guai_array.length>0){
					for(var i:int=0;i<guai_array.length;i++){
						if(guai_array[i].currentFrame==17){
							var bb:prompt=new prompt(this,4,guai_array[i].x,guai_array[i].y)
							prompt_arr[3]=true
							addChild(_prompt)
							return
						}
					}
				}
				if(!prompt_arr[0]){
					var cc:prompt=new prompt(this,1,245,20)
					prompt_arr[0]=true
					addChild(_prompt)
					return
				}
				if(!prompt_arr[1]){
					var dd:prompt=new prompt(this,2,500,230)
					prompt_arr[1]=true
					addChild(_prompt)
					return
				}
				if(!prompt_arr[6]){
					var ee:prompt=new prompt(this,7,440,250)
					prompt_arr[6]=true
					addChild(_prompt)
					return
				}
				if(!prompt_arr[4]){
					var gg:prompt=new prompt(this,5,55,315)
					prompt_arr[4]=true
					addChild(_prompt)
					return
				}
				if(!prompt_arr[7]){
					var hh:prompt=new prompt(this,8,622,162)
					prompt_arr[7]=true
					addChild(_prompt)
					return
				}
				if(!prompt_arr[5]){
					var ff:prompt=new prompt(this,6,15,40)
					prompt_arr[5]=true
					addChild(_prompt)
					return
				}
				
			}
			
		}
		public function swap_depth(){
			for(var j:int=0;j<guai_array.length;j++){
				for(var k:int=j+1;k<guai_array.length;k++){
					if(guai_array[j].currentFrame ==17 || guai_array[k].currentFrame == 17)
					continue
					if(guai_array[j].distance<guai_array[k].distance && this.getChildIndex(guai_array[j])<this.getChildIndex(guai_array[k])){
					this.swapChildren(guai_array[j],guai_array[k])
					/*var aa=guai_array[j]
					guai_array[j]=guai_array[k]
					guai_array[k]=aa*/
					//trace(j)
					}
				}
			}
		}
		public function _frame(e:Event){
			game.jiance.x=mouseX;
			game.jiance.y=mouseY
			garde_txt.text=String(garde)
			hp_txt.text=String(hp)
			
			show_prompt()
			swap_depth()
			
			for(var i:int=0;i<me_array.length;i++){
				guai_fangwei=new Array()
				for(var j:int=0;j<guai_array.length;j++){
					var dx:Number=me_array[i].x-guai_array[j].x;
					var dy:Number=me_array[i].y-guai_array[j].y;
					if(Math.sqrt(dx*dx+dy*dy)<=me_array[i].fangwei){
						guai_fangwei.push(guai_array[j])
					}
				}
				me_array[i].guai_array=guai_fangwei
				me_array[i].setEnemy(guai_fangwei);
			}
			for(i=0;i<du_array.length;i++){
				for(j=0;j<me_array.length;j++){
					if(du_array[i].hit==true){
						dx=du_array[i].x-me_array[j].x
						dy=du_array[i].y-me_array[j].y
						if(Math.sqrt(dx*dx+dy*dy)<=me_array[j].fangwei){
							guai_fangwei=new Array()
							guai_fangwei.push(du_array[i])
							me_array[j].setEnemy(guai_fangwei)
							me_array[j].guai_array=guai_fangwei
					}
					}
					else{
						break
					}
				}
			}
				for(i=0;i<du_array.length;i++){
				if(du_array[i]._shengmingzhi<=0){
					du_array[i].removeEventListener(MouseEvent.MOUSE_DOWN,gongji)
					game.removeChild(du_array[i])
					du_array.splice(i,1)
					var _destorySound=new destorySound()
					_destorySound.play()
				}
			}
			
			if(me_change.visible==true)
			game.jiance.visible=false;
			else
			game.jiance.visible=true
			for(i=0;i<du_array.length;i++){
				if(game.jiance.hitTestObject(du_array[i])){
				game.jiance.alpha=0
				return
				}
			}
			for(j=0;j<me_array.length;j++){
				if(game.jiance.hitTestObject(me_array[j])){
				game.jiance.alpha=0
				return
				}
			}
			if(mouseY<50+0.5*game.jiance.height || mouseY>600-0.5*game.jiance.height || mouseX>800-0.5*game.jiance.width || mouseX<0+0.5*game.jiance.width){
			game.jiance.alpha=0
			return
			}
			game.jiance.alpha=0.1
			
		}
		public function gongji(e:MouseEvent){
			e.target.hit=!e.target.hit
		}
		public function startguai(){
			current++
			if(current>total){
				this.addEventListener(Event.ENTER_FRAME,check_game)
				current--
				return
			}
			guai_speed=guai_speed_arr[current_level-1][current-1]
			guai_xue=guai_shengming_arr[current_level-1][current-1]
			guai_num=guai_num_arr[current_level-1][current-1]
			ti=new Timer(guai_time/guai_speed,guai_num)
			ti.addEventListener(TimerEvent.TIMER,showguai)
			ti.addEventListener(TimerEvent.TIMER_COMPLETE,finish)
			ti.start()
			show_text()
		}
		public function showguai(e:TimerEvent){
			var aa:MovieClip;
			//a=11
			if(guai_chunxu.length==0){
				for(var i:int=0;i<13;i++){
					guai_chunxu.push(i)
				}
			}
			var b:int=Math.random()*guai_chunxu.length
			a=guai_chunxu[b]
			guai_chunxu.splice(b,1)
			switch(a){
				case 0:aa=new 香蕉怪();break;
				case 1:aa=new 洗衣机怪();break;
				case 2:aa=new 薯片袋怪();break;
				case 3:aa=new 牛奶怪();break;
				case 4:aa=new 面包怪();break;
				case 5:aa=new 筷子怪();break;
				case 6:aa=new 可乐怪();break;
				case 7:aa=new 咖啡怪();break;
				case 8:aa=new 鸡蛋怪();break;
				case 9:aa=new 电视机怪();break;
				case 10:aa=new 灯泡怪();break;
				case 11:aa=new 冰箱怪();break;
				case 12:aa=new 鱼骨怪();break;
			}			
			aa.speed=guai_speed
			aa.max_speed=guai_speed
			aa._shengmingzhi=guai_xue
			aa.max_shengmingzhi=guai_xue
			aa.reborn=rebort_array[current_level-1]
			aa._min=min_max_array[current_level-1][0]
			aa._max=min_max_array[current_level-1][1]
			aa.set_pathArr(pathArr[current_level-1])
			addChild(aa)
			if(current_level==3)
			addChild(game._menpai)
			if(_prompt)
			addChild(_prompt)
			guai_array.push(aa)
		}
		public function finish(e:TimerEvent){
			ti2=new Timer(10000+current*300,1)
			ti2.addEventListener(TimerEvent.TIMER_COMPLETE,again)
			ti2.start()
		}
		public function again(e:TimerEvent){
			startguai()
		}
		public function removeBullet(pass:MovieClip){
			for(var i in guai_array) {
				if (guai_array[i] == pass) {
					guai_array.splice(i,1);
					break;
				}
			}
		}
		public function show_text(){
			this.progress_text.text=current+"/"+total
		}
		public function check_game(e:Event){
			if(guai_array.length==0){
			this.removeEventListener(Event.ENTER_FRAME,check_game)
			success()
			}
		}
		public function remove(){
			_main.current=current+"/"+total
			_main.garde=garde;
			//game._jingling.shengming.visible=false
			this.removeEventListener(Event.ADDED_TO_STAGE,_add)
			this.removeEventListener(MouseEvent.MOUSE_DOWN,_MOUSE_DOWN)
			this.removeEventListener(Event.ENTER_FRAME,_frame)
			if(ti){
				if(ti.running){
				ti.stop()
				ti.removeEventListener(TimerEvent.TIMER,showguai)
				ti.removeEventListener(TimerEvent.TIMER_COMPLETE,finish)
				}
			}
			if(ti2){
				if(ti2.running){
				ti2.stop()
				ti2.removeEventListener(TimerEvent.TIMER_COMPLETE,again)
				}
			}
			if(ti3){
				if(ti3.running){
				ti3.stop()
				ti3.removeEventListener(TimerEvent.TIMER,time_text)
				}
			}
			
			for(var i:int=guai_array.length-1;i>=0;i--){
				guai_array[i].deleteBullet()
				guai_array.splice(i,1)
			}
		}
		public function show_regular(e:MouseEvent){
			_main.show_regular()
		}
		public function fail(e:MouseEvent){
			remove()
			var _failSound=new failSound()
			_failSound.play()
			_main.show_over()
		}
		public function success(){
			remove()
			var _successSound=new successSound()
			_successSound.play()
			if(_main.localdata.data.success_level.indexOf(int(current_level+2))==-1){
				if(current_level<3){
					_main.localdata.data.success_level.push(current_level+2)
					_main.localdata.data.introduce_level=current_level+2
					_main.localdata.flush()
				}
				_main.show_win(current_level*2-1)
			}
			else{
			_main.show_win(current_level*2)
			}
		}
	}
	
}
