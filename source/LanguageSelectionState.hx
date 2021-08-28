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

class LanguageSelectionState extends MusicBeatState
{
	public static var isStory:Bool = false;

	public var view:FlxSprite;
	public var osuview:FlxSprite;

	public var txt:FlxText;
	public var txtr:FlxText;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('faggot'));
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);
	}

	override function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ONE)
		{
			Localizations.languageVar = 'eng';
			Localizations.setLanguage();
			FlxG.switchState(new WarningState());
		}

		if (FlxG.keys.justPressed.TWO)
		{
			Localizations.languageVar = 'por';
			Localizations.setLanguage();
			FlxG.switchState(new WarningState());
		}

		if (FlxG.keys.justPressed.THREE)
		{
			Localizations.languageVar = 'esp';
			Localizations.setLanguage();
			FlxG.switchState(new WarningState());
		}

		if (FlxG.keys.justPressed.FOUR)
		{
			Localizations.languageVar = 'ita';
			Localizations.setLanguage();
			FlxG.switchState(new WarningState());
		}
		
		super.update(elapsed);
	}
}
