package;


import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;


class Main extends Sprite {
	
	private var _instance:EmptyInterface;
	private var _tf:TextField;
	
	public function new () {
		
		super ();
		
		// Create instance of ClassWithStringProp.
		var c1:ClassWithStringProp = new ClassWithStringProp("test");
		
		// _instance is typed to the interface
		_instance = c1;
		
		// Create array and push _instance to it. Need to cast back to ClassWithStringProp to work
		var arr:Array<ClassWithStringProp> = new Array<ClassWithStringProp>();
		arr.push(cast _instance);
		
		// Save reference of first element in c2. c2 is now same instance as c1 and _instance.
		var c2:ClassWithStringProp = arr[0];
		
		
		printText( "c1 == c2: " + (c1 == c2) );		// Assure c1 == c2. Will print out: true
		printText( "c1.string: " + c1.string ); 	// Assure value exists in c1. Will print out "test"
		printText( "c2.string: " + c2.string );		// Crash on cpp target. Works in flash, html5 and neko.
		
		
		// Lets get arr[0] again, but this time we type it as Dynamic. Now c1 == c2 == c3
		var c3:Dynamic = arr[0];
		printText( "c3.string: " + c3.string );		// This works on cpp targets without crash!!!
		
		
	}
	
	
	
	
	
	// Logging function
	function printText(string:String) 
	{
		if (_tf == null) {
			_tf = new TextField();
			_tf.multiline = true;
			_tf.wordWrap = true;
			_tf.width = 300;
			_tf.text = "";
			addChild(_tf);
		}
		
		_tf.text += string + "\n";
	}
}