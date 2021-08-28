package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import Controls.KeyboardScheme;

class GameOverSubstate extends MusicBeatSubstate
{
	var bf:Boyfriend;
	var camFollow:FlxObject;

	var stageSuffix:String = "";

	public function new(x:Float, y:Float)
	{
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			Localizations.deathVar + PlayState.causeOfDeath + "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			32);
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(255, 255, 255), CENTER);
		txt.screenCenter();
		txt.scrollFactor.set();

		var daStage = PlayState.curStage;
		var daBf:String = '';
		switch (PlayState.SONG.player1)
		{
			case 'bf-pixel':
				stageSuffix = '-pixel';
				daBf = 'bf-pixel-dead';
			default:
				daBf = 'bf';
		}

		super();

		Conductor.songPosition = 0;

		bf = new Boyfriend(x, y, daBf);
		add(bf);

		camFollow = new FlxObject(bf.getGraphicMidpoint().x, bf.getGraphicMidpoint().y, 1, 1);
		add(camFollow);

		add(txt);

		FlxG.sound.play(Paths.sound('fnf_loss_sfx' + stageSuffix));
		Conductor.changeBPM(100);

		// FlxG.camera.followLerp = 1;
		// FlxG.camera.focusOn(FlxPoint.get(FlxG.width / 2, FlxG.height / 2));
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;

		bf.playAnim('firstDeath');
	}

	var startVibin:Bool = false;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.save.data.isSwitched == true)
		{
			FlxG.save.data.upBind = FlxG.save.data.lastUp;
			FlxG.save.data.downBind = FlxG.save.data.lastDown;
			FlxG.save.data.leftBind = FlxG.save.data.lastLeft;
			FlxG.save.data.rightBind = FlxG.save.data.lastRight;

			trace (FlxG.save.data.leftBind, FlxG.save.data.downBind, FlxG.save.data.upBind, FlxG.save.data.rightBind);

			if (FlxG.save.data.dfjk)
				controls.setKeyboardScheme(KeyboardScheme.Solo, true);
			else
				controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);
		}
		
		if (controls.ACCEPT)
		{
			endBullshit();
		}

		if (controls.BACK)
		{
			FlxG.save.data.isSwitched = false;

			FlxG.save.data.upBind = FlxG.save.data.lastUp;
			FlxG.save.data.downBind = FlxG.save.data.lastDown;
			FlxG.save.data.leftBind = FlxG.save.data.lastLeft;
			FlxG.save.data.rightBind = FlxG.save.data.lastRight;
			if (FlxG.save.data.dfjk)
				controls.setKeyboardScheme(KeyboardScheme.Solo, true);
			else
				controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);
			
			FlxG.sound.music.stop();

			if (PlayState.isStoryMode)
				FlxG.switchState(new BadEndState());
			else
				FlxG.switchState(new FreeplayState());
			PlayState.loadRep = false;
		}

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.curFrame == 12)
		{
			FlxG.camera.follow(camFollow, LOCKON, 0.01);
		}

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.finished)
		{
			FlxG.sound.playMusic(Paths.music('gameOver' + stageSuffix));
			startVibin = true;
		}

		if (FlxG.sound.music.playing)
		{
			Conductor.songPosition = FlxG.sound.music.time;
		}
	}

	override function beatHit()
	{
		super.beatHit();

		if (startVibin && !isEnding)
		{
			bf.playAnim('deathLoop', true);
		}
		FlxG.log.add('beat');
	}

	var isEnding:Bool = false;

	function endBullshit():Void
	{
		if (!isEnding)
		{
			PlayState.startTime = 0;
			isEnding = true;
			bf.playAnim('deathConfirm', true);
			FlxG.sound.music.stop();
			FlxG.sound.play(Paths.music('gameOverEnd' + stageSuffix));
			new FlxTimer().start(0.7, function(tmr:FlxTimer)
			{
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
				{
					FlxG.save.data.isSwitched = false;

					FlxG.save.data.upBind = FlxG.save.data.lastUp;
					FlxG.save.data.downBind = FlxG.save.data.lastDown;
					FlxG.save.data.leftBind = FlxG.save.data.lastLeft;
					FlxG.save.data.rightBind = FlxG.save.data.lastRight;
					if (FlxG.save.data.dfjk)
						controls.setKeyboardScheme(KeyboardScheme.Solo, true);
					else
						controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);
					
					/*if (PlayState.isStoryMode)
						FlxG.switchState(new StoryMenuState());
					else
						FlxG.switchState(new FreeplayState());*/
					
					LoadingState.loadAndSwitchState(new PlayState());
				});
			});
		}
	}
}
