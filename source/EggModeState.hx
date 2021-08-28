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

class EggModeState extends MusicBeatState
{
	public var txt:FlxText;

	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";
	public static var currChanges:String = "dk";
	
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		
		switch (FlxG.save.data.language)
		{
			default:
				txt = new FlxText(0, 0, FlxG.width,
					"Congratualtions, playeth'r! thee has't unlock'd ye egg mode!",
					32);

			case 'eng':
				txt = new FlxText(0, 0, FlxG.width,
					"Congratualtions, playeth'r! thee has't unlock'd ye egg mode",
					32);

			case 'ita':
				txt = new FlxText(0, 0, FlxG.width,
					"Le mie congratvlazioni, giocatore! Lei ha sbloccato la nvova e fvtvristica modvs ovum!",
					32);

			case 'esp':
				txt = new FlxText(0, 0, FlxG.width,
					"Le mie congratvlazioni, giocatore! Lei ha sbloccato la nvova e fvtvristica modvs ovum!",
					32);
		}
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
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
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
