package { 



	import flash.display.Sprite;
	import flash.text.StyleSheet; 
	import flash.text.TextFieldAutoSize; 
	import flash.text.TextFormat; 
	import flash.events.Event; 
	import flash.display.LoaderInfo; 
	import flash.text.AntiAliasType; 
	import nl.demonsters.debugger.MonsterDebugger;
	import flash.events.MouseEvent; 
	import flash.text.TextFormatAlign; 
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

public class Main extends Sprite {

	var headText		: String;
	var subText			: String;
	var mainPage		: String;
	var style 			: StyleSheet;
	var styleString 	: String;
	var headerFormat 	: TextFormat;
	var subFormat	 	: TextFormat;	
	var origY			: Number;
	

	public function Main () {
		
		if(stage)
		    init();
		else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
	private function init(e:Event = null) : void {
		
			try {
			    var keyStr:String;
			    var valueStr:String;
			    var paramObj:Object = LoaderInfo(stage.loaderInfo).parameters;

				
				if (paramObj.headText){
				 	headText = paramObj.headText;
				} else {
					headText = "lorem ipsum";
				}

				if (paramObj.subText){
					subText = paramObj.subText;
				} else {
					subText = "mucho dolor sit amet";
				}				
				
				if (paramObj.mainPage){
					mainPage = paramObj.mainPage;
				} else {
					mainPage = "/";
				}
				
			    for (keyStr in paramObj) {
			        valueStr = String(paramObj[keyStr]);

			    }
			} catch (error:Error) {
				
			}
		


		
		
		with(holder){
		hitter.buttonMode = true;
		
		headerFormat = new TextFormat();
		headerFormat.align = TextFormatAlign.CENTER;

		
		headerField.autoSize 	= TextFieldAutoSize.LEFT;
		headerField.antiAliasType = AntiAliasType.ADVANCED;
		headerField.embedFonts 	= true;
		headerField.multiline 	= false;
		headerField.defaultTextFormat = headerFormat;
		underField.autoSize 	= TextFieldAutoSize.LEFT;
		underField.antiAliasType = AntiAliasType.ADVANCED;	
		underField.embedFonts 	= true;
		underField.multiline 	= false;
		underField.defaultTextFormat = headerFormat;
	
		headerField.text = headText;
		underField.text = subText;
		hitter.addEventListener(MouseEvent.MOUSE_OVER, handleMouse);
		hitter.addEventListener(MouseEvent.MOUSE_OUT, handleMouse);
		hitter.addEventListener(MouseEvent.CLICK, handleMouse);


		headerField.y -= 7;
		underField.y = (headerField.y + headerField.height +18);		
		origY = headerField.y;
		
	}

	holder.rotationY = -30;
	holder.rotationZ = -5;
	holder.rotationX = 20;
	
	with(holder){
		headerField.rotationY = 5;
		underField.rotationY = -4;
	}
		
	}
	
	private function handleMouse(m:MouseEvent) : void {
		switch (m.type){
			case MouseEvent.MOUSE_OVER :
			holder.headerField.y = origY -5;
			break;
			
			case MouseEvent.MOUSE_OUT : 
			holder.headerField.y = origY;
			break;
			
			case MouseEvent.CLICK : 
			var req:URLRequest = new URLRequest(mainPage);
			navigateToURL(req, "_self");
			break;
			
		}
	}	
		

	}

}