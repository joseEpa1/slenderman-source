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

class ArrowSelectionState extends MusicBeatState
{
	public static var isStory:Bool = false;

	public var view:FlxSprite;
	public var osuview:FlxSprite;

	public var txt:FlxText;
	public var txtr:FlxText;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.screenCenter();
		bg.antialiasing = true;
		bg.color = FlxColor.fromRGB(60, 60, 60);
		add(bg);

		view = new FlxSprite().loadGraphic(Paths.image('style previews/normal'));
		view.scale.x *= 0.6;
		view.scale.y *= 0.6;
		view.screenCenter();
		view.antialiasing = true;

		osuview = new FlxSprite().loadGraphic(Paths.image('style previews/osu'));
		osuview.scale.x *= 0.6;
		osuview.scale.y *= 0.6;
		osuview.screenCenter();
		osuview.antialiasing = true;

		add(osuview);
		add(view);
		
		//a bit shitty but it works lolmfaoxdrofl
		txt = new FlxText(0, 0, FlxG.width,
			"Choose an arrow style"
			+ "\n\n\n\n\n\n\n                                  >\n\n\n\n\n\n\n",
			32);
		
		txt.setFormat("VCR OSD Mono", 46, FlxColor.fromRGB(255, 255, 255), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);

		txtr = new FlxText(0, 0, FlxG.width,
			"Choose an arrow style"
			+ "\n\n\n\n\n\n\n<                                  \n\n\n\n\n\n\n",
			32);
		
		txtr.setFormat("VCR OSD Mono", 46, FlxColor.fromRGB(255, 255, 255), CENTER);
		txtr.borderColor = FlxColor.BLACK;
		txtr.borderSize = 3;
		txtr.borderStyle = FlxTextBorderStyle.OUTLINE;
		txtr.screenCenter();
	}

	override function update(elapsed:Float)
	{
		if (controls.RIGHT)
		{
			add(txtr);
			remove(txt);
			view.visible = false;
			osuview.visible = true;
			FlxG.save.data.arrowStyle = "osu";
		}

		if (controls.LEFT)
		{
			add(txt);
			remove(txtr);
			view.visible = true;
			osuview.visible = false;
			FlxG.save.data.arrowStyle = "normal";
		}

		if (controls.ACCEPT)
		{
			if (isStory)
				FlxG.switchState(new StoryMenuState());
			else
				FlxG.switchState(new FreeplayState());
		}
		if (controls.BACK)
		{
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
