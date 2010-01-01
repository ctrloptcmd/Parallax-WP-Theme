package {

	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.net.URLLoader;

	import flash.text.StyleSheet; 
	import flash.text.TextFieldAutoSize; 
	import flash.events.MouseEvent; 
	import flash.events.Event; 

	import caurina.transitions.*;

	import no.martinjacobsen.XTrace;	
	import no.martinjacobsen.string.URLValidator;
	import no.martinjacobsen.net.services.TweetPipeLoad;
	import flash.filters.BlurFilter; 
	import flash.filters.BitmapFilterQuality; 
	import flash.net.navigateToURL; 
	import flash.display.LoaderInfo; 
		



	public class Main extends Sprite {

	private var pipeLoad 	: TweetPipeLoad;
	private var style 		: StyleSheet;
	private var styleString : String;
	private var validator 	: URLValidator;
	private var tweets 		: Array;
	private var current 		: uint = 0;
	private var fs 			: uint;
	private var chopper 		: uint = 3;
	private var twitterID 	: String;
	private var ignoreReplies		: Boolean;
	



		public function Main () {			
			if(stage)
			    init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
			
		private function init(e:Event = null) : void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
						
			try {
			    var keyStr:String;
			    var valueStr:String;
			    var paramObj:Object = LoaderInfo(stage.loaderInfo).parameters;
					XTrace.log(paramObj);
				
				if (paramObj.twitterID){
					twitterID = paramObj.twitterID;
				} else {
					twitterID = "200523"//"618593";
				}

				if (paramObj.ignoreReplies){
					if(paramObj.ignoreReplies == "true") {
							ignoreReplies = true;
							XTrace.log("IGNORE");
					} else {
						ignoreReplies = false;
					}		
				} else {
					ignoreReplies = false;
				}				
				
			    for (keyStr in paramObj) {
			        valueStr = String(paramObj[keyStr]);
			        XTrace.log("Flashvars: " + "\t" + keyStr + ":\t" + valueStr + "\n");
			    }
			} catch (error:Error) {
			    XTrace.log(error.toString());
			}
			
			style = new StyleSheet();
			tfHolder.tweetField.autoSize = TextFieldAutoSize.LEFT;
			pipeLoad = new TweetPipeLoad(twitterID, ignoreReplies);
			pipeLoad.addEventListener("TweetComplete", onTweetComplete);
		   validator = new URLValidator();
			setUpButtons();
			
		}
		
		
		private function onTweetComplete(e:Event) : void {
			tweets = [];
			/*chopper = userName.length + 2*/
			for (var i:int = 0; i < pipeLoad.getTweets().length; i++){
				tweets[i] = validator.tag(pipeLoad.getTweets()[i]);
				tweets[i] = tweets[i].substr()
					trace(tweets[i])
				
			}


				i = 0;
				tfHolder.tweetField.htmlText = tweets[0];
				tfHolder.tweetField.styleSheet = style;

				while(tfHolder.tweetField.textHeight > 171){
					fs -= 2;
				    tfHolder.styleSheet = null;
				    styleString = "a{font-Style:bold; color:#66CCFF;} h1{font-size:"+fs+"}";
				    style.parseCSS(styleString);
				    tfHolder.tweetField.styleSheet = style;               
		    }
				switchIt(current);
		}
		
		
		
		private function switchIt(i:int){

			var filter:BlurFilter=new BlurFilter(100,0,BitmapFilterQuality.MEDIUM);
			var filters_array:Array=new Array();
			filters_array.push(filter);
			tfHolder.filters=filters_array;
			tfHolder.tweetField.htmlText = "<h1>" +tweets[i] + "</h1>";

				styleString = "a{font-Style:bold; color:#66CCFF;} h1{font-size:"+fs+"}";
		   	style.parseCSS(styleString);
		   	tfHolder.tweetField.styleSheet = style;
				fs = 500;

			do {

				fs -= 2;
				tfHolder.styleSheet = null;
				styleString = "a{font-Style:bold; color:#66CCFF;} h1{font-size:"+fs+"}";
				style.parseCSS(styleString);
				tfHolder.tweetField.styleSheet = style;
			} 

		while (tfHolder.tweetField.textHeight > 171); 



	 	if(i < tweets.length -1 && i > 0){

			enableControl(controls.back);
			enableControl(controls.forward);			

			if(!controls.forward.hasEventListener(MouseEvent.CLICK)){
			 	controls.forward.addEventListener(MouseEvent.CLICK, onFwdClick);
				}		
			if(!controls.back.hasEventListener(MouseEvent.CLICK)){
				controls.back.addEventListener(MouseEvent.CLICK, onBckClick);
				}					

		} else if(i >= tweets.length - 1){
			disableControl(controls.back);
		} else if (i <= 0){
			disableControl(controls.forward);
		}
			Tweener.addTween(tfHolder,{_blur_blurX:0,_blur_blurY:0, time:1});	
		}
		
		private function onLinkClick (e:MouseEvent) :void {
			var twitter:URLRequest = new URLRequest("http://www.twitter.com/" + pipeLoad.userName);
			navigateToURL(twitter);
		}
		
		private function onFwdClick(e:MouseEvent) : void {
					current--
					switchIt(current);	
		}

		private function onBckClick(e:MouseEvent) : void {
					current++
					switchIt(current);
		}
		
		private function setUpButtons() : void {
			controls.back.addEventListener(MouseEvent.CLICK, onBckClick);
			controls.forward.addEventListener(MouseEvent.CLICK, onFwdClick);
			controls.twitLink.addEventListener( MouseEvent.CLICK, onLinkClick);
			controls.back.buttonMode = true;
			controls.forward.buttonMode = true;		
			controls.twitLink.buttonMode = true;
		}
		
		private function disableControl(who:MovieClip) : void {
			who.alpha = .3;
			who.enabled = false;
			who.buttonMode = false;
			if(who == controls.back){
				who.removeEventListener(MouseEvent.CLICK, onBckClick);
			} else if(who == controls.forward) {
				who.removeEventListener(MouseEvent.CLICK, onFwdClick);	
			}
		}

		private function enableControl(who:MovieClip) : void {
			who.alpha = 1;
			who.enabled = true;
			who.buttonMode = true;
			who.removeEventListener(MouseEvent.CLICK, onBckClick);

			}		
		
		}

}
