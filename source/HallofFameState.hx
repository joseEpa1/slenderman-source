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

class HallofFameState extends MusicBeatState
{
	public var txtRight:FlxText;
	public var txtLeft:FlxText;
	public var hallAnimeshoun : FlxSprite;
	public var selectedP:Int = 0;

	override function create()
	{
		super.create();

		var coverPS:FlxSprite = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFFFFFFFF);
		coverPS.scrollFactor.set();
		add(coverPS);

		var txt:FlxText = new FlxText(0, 0, FlxG.width, Localizations.hallDesc +
		  "\n\n\n\n\n\n\n\n\n<"
		+ "                                           "
		+ ">\n\n\n\n\n\n\n\n",
			32);
		
		txt.setFormat("VCR OSD Mono", 42, FlxColor.fromRGB(255, 255, 255), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);

		switch (Localizations.languageVar)
		{
			default:
				txtRight = new FlxText(0, 0, FlxG.width,
				"\n\n\n\n\n\n\n\n\n\n "
				+ "                                           "
				+ ">\n\n\n\n\n\n\n\n",
				32);

				txtLeft = new FlxText(0, 0, FlxG.width,
				"\n\n\n\n\n\n\n\n\n\n<"
				+ "                                           "
				+ " \n\n\n\n\n\n\n\n",
					32);
		}
		
		txtLeft.setFormat("VCR OSD Mono", 42, FlxColor.ORANGE, CENTER);
		txtLeft.borderColor = FlxColor.BLACK;
		txtLeft.borderSize = 3;
		txtLeft.borderStyle = FlxTextBorderStyle.OUTLINE;
		txtLeft.screenCenter();

		txtRight.setFormat("VCR OSD Mono", 42, FlxColor.ORANGE, CENTER);
		txtRight.borderColor = FlxColor.BLACK;
		txtRight.borderSize = 3;
		txtRight.borderStyle = FlxTextBorderStyle.OUTLINE;
		txtRight.screenCenter();

		hallAnimeshoun = new FlxSprite(0, -50);
		hallAnimeshoun.frames = Paths.getSparrowAtlas('sprs/halloffame');
		hallAnimeshoun.animation.addByPrefix('kong', 'kong', 24, true);
		hallAnimeshoun.animation.addByPrefix('neth', 'neth', 24, true);
		hallAnimeshoun.animation.addByPrefix('migo', 'migo', 24, true);
		hallAnimeshoun.screenCenter();
		hallAnimeshoun.scrollFactor.set();
		hallAnimeshoun.antialiasing = true;
		hallAnimeshoun.animation.play('kong');
		hallAnimeshoun.setGraphicSize(Std.int(hallAnimeshoun.width * 0.5));
		add(hallAnimeshoun);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			FlxG.switchState(new MainMenuState());
		}

		if (FlxG.keys.justPressed.RIGHT)
		{
			FlxG.sound.play(Paths.sound('click-start'));
			add(txtRight);
		}

		if (FlxG.keys.justReleased.RIGHT)
		{
			remove(txtRight);
			FlxG.sound.play(Paths.sound('click-end'));
			switch (selectedP)
			{
				case 0:
					hallAnimeshoun.animation.play('neth');
					selectedP = 1;
				case 1:
					hallAnimeshoun.animation.play('migo');
					selectedP = 2;
				case 2:
					hallAnimeshoun.animation.play('kong');
					selectedP = 0;
			}
		}

		if (FlxG.keys.justPressed.LEFT)
		{
			FlxG.sound.play(Paths.sound('click-start'));
			add(txtLeft);
		}

		if (FlxG.keys.justReleased.LEFT)
		{
			remove(txtLeft);
			FlxG.sound.play(Paths.sound('click-end'));
			switch (selectedP)
			{
				case 0:
					hallAnimeshoun.animation.play('migo');
					selectedP = 2;
				case 1:
					hallAnimeshoun.animation.play('kong');
					selectedP = 0;
				case 2:
					hallAnimeshoun.animation.play('neth');
					selectedP = 1;
			}
		}
		
		//https://youtu.be/P87DJnpSBqA?t=12

		super.update(elapsed);
	}
}
