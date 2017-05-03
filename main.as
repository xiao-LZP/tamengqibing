package  {
	
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.media.SoundTransform;
	import flash.text.TextFormat;
	import flash.display.SimpleButton;
	import flash.net.SharedObject;
	import flash.events.Event;
	
	
	public class main extends MovieClip {
		public var bgmusic:Sound;
		public var url:URLRequest;
		public var channel:SoundChannel;
		public var soundVolume:SoundTransform;
		public var _menu:menu;
		public var _chang_level:chang_level;
		public var _bgmusic_setup:bgmusic_setup;
		public var format:TextFormat=new TextFormat();
		public var localdata:SharedObject;
		public var game:MovieClip;
		public var _over:MovieClip;
		public var current:String
		public var garde:Number;
		public var current_level:int;
		public var _win:win;
		public var _star_anim:star_anim;
		public var _help:help;
		public var _about:about
		public var _regular:提示4
		public var song_arr=["SOUND/背景音乐1.mp3","SOUND/沉睡的精灵.mp3","SOUND/陈依婷 - 心愿.mp3"]
		
		public function main() {
			// constructor code
			localdata_save()
			this.addEventListener(Event.ADDED_TO_STAGE,_add)
		}
		public function _add(e:Event){
			show_bgmusic(localdata.data.sound)
			if(localdata.data.anim==false)
			show_star_anim()
			else
			show_menu()
		}
		public function show_star_anim(){
			_star_anim=new star_anim(this)
			addChild(_star_anim)
			localdata.data.anim=true
		}
		public function clean_star_anim(){
			if(_star_anim){
				removeChild(_star_anim)
				_star_anim=null
			}
		}
		public function localdata_save(){
			localdata=SharedObject.getLocal("塔萌奇兵5");
			if(isNaN(localdata.data.volumes)){
			localdata.data.volumes=1
			localdata.flush()
			}
			if(!localdata.data.sound){
			localdata.data.sound=song_arr[0]
			localdata.flush()
			}
			if(!localdata.data.anim){
				localdata.data.anim=false
				localdata.flush()
			}
			if(!localdata.data.success_level){
				localdata.data.success_level=new Array()
				for(var i:int=0;i<3;i++){
					//trace(i)
					localdata.data.success_level.push(i)
				}
				localdata.flush()
			}
			if(isNaN(localdata.data.introduce_level)){
				localdata.data.introduce_level=2
				localdata.flush()
			}
			//trace(localdata.data.sound)
		}
		public function show_bgmusic(pass:String){
			bgmusic=new Sound()
			url=new URLRequest(pass)
			bgmusic.load(url)
			channel=bgmusic.play()
			channel.addEventListener(Event.SOUND_COMPLETE,music_again)
			volume_size(localdata.data.volumes)
		}
		public function music_again(e:Event){
			show_bgmusic(localdata.data.sound)
		}
		public function volume_size(pass:Number){
			soundVolume=new SoundTransform()
			soundVolume.volume=pass
			channel.soundTransform=soundVolume
		}
		public function clean_to_game(){
			if(_menu){
				removeChild(_menu)
				_menu=null
			}
			if(_chang_level){
			removeChild(_chang_level)
			_chang_level=null
			}
			if(game){
				removeChild(game)
				game=null
			}
			if(_over){
				removeChild(_over)
				_over=null
			}
			if(_win){
				removeChild(_win)
				_win=null
			}
			if(_regular){
				removeChild(_regular)
				_regular=null
			}
		}
		public function clean_chang_level(){
			if(_chang_level){
			removeChild(_chang_level)
			_chang_level=null
			}
		}
		public function show_menu(){
			//clean()
			_menu=new menu(this)
			addChild(_menu)
		}
		public function show_level(){
			 _chang_level=new chang_level(this)
			 addChild(_chang_level)
		}
		public function show_bgmusic_setup(){
			_bgmusic_setup=new bgmusic_setup(this)
			_bgmusic_setup.volume_slider.value=localdata.data.volumes;
			var soundnum:int=song_arr.indexOf(localdata.data.sound)
			for(var i:int=0;i<3;i++){
				_bgmusic_setup["song"+i].gotoAndStop(3)
			}
			_bgmusic_setup["song"+soundnum].gotoAndStop(2)
				
			
			addChild(_bgmusic_setup)
		}
		public function clean_bgmusic_setup(){
			if(_bgmusic_setup){
			removeChild(_bgmusic_setup)
			_bgmusic_setup=null
			}
		}
		public function startgame(pass:String){
			current_level=int(pass.slice(2))
			game=new thegame(this)
			addChild(game)
		}
		public function show_over(){
			_over=new over(this)
			_over.txt.text=current
			_over.txt2.text=String(garde)
			addChild(_over)
		}
		public function show_win(pass:int){
			_win=new win(this)
			_win.gotoAndStop(pass)
			//_win.txt.text=String(current_level)
			_win.txt2.text=String(garde)
			addChild(_win)
			//trace(garde)
		}
		public function show_help(){
			_help=new help(this)
			addChild(_help)
		}
		public function clean_help(){
			if(_help){
				removeChild(_help)
				_help=null
			}
		}
		public function show_about(){
			_about=new about(this)
			addChild(_about)
		}
		public function clean_about(){
			if(_about){
				removeChild(_about)
				_about=null
			}
		}
		public function show_regular(){
			_regular=new 提示4(this)
			addChild(_regular)
		}
		public function clean_regular(){
			if(_regular){
				removeChild(_regular)
				_regular=null
			}
		}

	}
	
}
