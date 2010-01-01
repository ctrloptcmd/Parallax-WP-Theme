package{

import flash.display.Sprite;
import caurina.transitions.*;
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.*;
import flash.filters.BlurFilter;
import flash.filters.BitmapFilterQuality;
import flash.events.TimerEvent;
import flash.utils.Timer;
import flash.net.URLRequest;
import flash.net.navigateToURL;
import flash.net.URLLoader;
import no.martinjacobsen.net.services.TweetPipeLoad;
import no.martinjacobsen.string.CheatCode;
import no.martinjacobsen.string.URLValidator;


public class Pipe extends Sprite{
	var style			:StyleSheet;
	var styleString		:String;
	var tpl				:TweetPipeLoad;
	var processed		:Array;
	var linked 			:Array;
	var validator 		:URLValidator;
	var i					:int;
	var fs 				:int;
	var ldr				:Loader;
	
	public function Pipe(){
		tpl = new TweetPipeLoad("200523");
		tpl.addEventListener("TweetComplete", onTweetComplete);
		controls.back.addEventListener(MouseEvent.CLICK, onBckClick);
		controls.forward.addEventListener(MouseEvent.CLICK, onFwdClick);
		controls.twitLink.addEventListener( MouseEvent.CLICK, onLinkClick);
		controls.back.buttonMode = true;
		controls.forward.buttonMode = true;		
		controls.twitLink.buttonMode = true;
		validator = new URLValidator();

	
		styleString = new String();

	}
	
	
	private function onTweetComplete(e:Event):void {
			processed = tpl.getTweets();
			linked = new Array();
			
			for each (var item:String in processed){
			var linkItem = validator.createLinks(item);
				linked.push(linkItem);
			}
			
			i = 0;
			tfHolder.tweetField.htmlText = validator.createLinks(processed[0]);
			tfHolder.tweetField.styleSheet = style;
			
			while(tfHolder.tweetField.textHeight > 171){
				fs -= 2;
			    tfHolder.styleSheet = null;
			    styleString = "a{font-Style:bold; color:#66CCFF;} h1{font-size:"+fs+"}";
			    style.parseCSS(styleString);
			    tfHolder.tweetField.styleSheet = style;               
	    }
			switchIt(i)				
	}
	

	
	private function switchIt(i:int){
		
		var filter:BlurFilter=new BlurFilter(100,0,BitmapFilterQuality.MEDIUM);
		var filters_array:Array=new Array();
		filters_array.push(filter);
		tfHolder.filters=filters_array;
		tfHolder.tweetField.htmlText = "<h1>" +linked[i] + "</h1>";

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
	
		

 	if(i < linked.length -1 && i > 0){
				
		enableControl(controls.back);
		enableControl(controls.forward);			

		if(!controls.forward.hasEventListener(MouseEvent.CLICK)){
		 	controls.forward.addEventListener(MouseEvent.CLICK, onFwdClick);
			}		
		if(!controls.back.hasEventListener(MouseEvent.CLICK)){
			controls.back.addEventListener(MouseEvent.CLICK, onBckClick);
			}					
							
	} else if(i >= linked.length - 1){
		disableControl(controls.back);
	} else if (i <= 0){
		disableControl(controls.forward);
	}
		Tweener.addTween(tfHolder,{_blur_blurX:0,_blur_blurY:0, time:1});	
	}
	

	
	private function onLdrClick (e:Event) :void {
		ldr.unload();
		removeChild(ldr);
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