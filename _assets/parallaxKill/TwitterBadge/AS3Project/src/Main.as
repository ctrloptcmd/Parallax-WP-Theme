package { 
	
	import flash.display.Sprite;
	import no.martinjacobsen.XTrace;
	import no.martinjacobsen.Rect;
	

	[SWF(width='550', height='400', backgroundColor='#FFFFFF', frameRate='60')]

public class Main extends Sprite {

	private var r : Rect;

	public function Main () {
		
		r = new Rect();
		addChild(r);
		
		}

	}

}

