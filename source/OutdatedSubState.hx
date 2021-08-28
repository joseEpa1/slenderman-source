package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public var buildNew:String = sys.Http.requestUrl("https://raw.githubusercontent.com/indigoUan/slenderman-datas/main/new%20shit");
	public var buildVar:String = sys.Http.requestUrl("https://raw.githubusercontent.com/indigoUan/slenderman-datas/main/last%20private%20build");

	override function create()
	{		
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"A new version of the mod has come out."
			+ "\n\nLast available version:\n"
			+ buildVar
			+ "\nNew stuff:\n"
			+ buildNew,
		32);
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(255, 255, 255), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			FlxG.switchState(new MainMenuState());
		}
		if (controls.BACK)
		{
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
