package  {
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import flash.net.FileReference;
	import flash.net.FileFilter;
	import flash.display.Loader;
	import flash.events.Event;
	
	
	public class bgmusic_setup extends Sprite {
		public var _main:main;
		public var back_button:SimpleButton;
		public var loader:Loader;
		
		public function bgmusic_setup(pass:main) {
			// constructor code
			_main=pass
			bg.alpha=0.5
			back_button.addEventListener(MouseEvent.CLICK,back_button_event)
			volume_slider.addEventListener(Event.CHANGE,volume_slider_event)
			for(var i:int=0;i<=2;i++){
				this["song"+i].addEventListener(MouseEvent.CLICK,chang_song)
				this["song"+i].buttonMode=true
			}
		}
	
		
		public function back_button_event(e:MouseEvent){
			_main.clean_bgmusic_setup()
		}
		public function volume_slider_event(e:Event){
			_main.volume_size(e.target.value)
			_main.localdata.data.volumes=e.target.value
			_main.localdata.flush()
		}
		public function chang_song(e:MouseEvent){
			_main.channel.stop()
			var str:String=String(e.target.name).slice(4)
			for(var i:int=0;i<3;i++){
				this["song"+i].gotoAndStop(3)
			}
			this["song"+str].gotoAndStop(2)
			_main.show_bgmusic(_main.song_arr[Number(str)])
			_main.localdata.data.sound=_main.song_arr[Number(str)]
			_main.localdata.flush()
		}
	}
	
}
