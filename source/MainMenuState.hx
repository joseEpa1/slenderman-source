package;

import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class MainMenuState extends MusicBeatState
{
	public var staticAnimeshoun:FlxSprite;

	public var lastCodeKey:Int = 0;

	var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;

	#if !switch
	var optionShit:Array<String> = ['story mode', 'freeplay'/*, 'donate'*/, 'options'];
	#else
	var optionShit:Array<String> = ['story mode', 'freeplay'];
	#end

	var newGaming:FlxText;
	var newGaming2:FlxText;
	public static var firstStart:Bool = true;

	public static var nightly:String = "";

	public static var kadeEngineVer:String = "1.6.1" + nightly;
	public static var gameVer:String = "0.2.7.1";

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	public static var finishedFunnyMove:Bool = false;

	override function create()
	{
		FlxG.save.data.lastDown = FlxG.save.data.downBind;
		FlxG.save.data.lastUp = FlxG.save.data.upBind;
		FlxG.save.data.lastRight = FlxG.save.data.rightBind;
		FlxG.save.data.lastLeft = FlxG.save.data.leftBind;

		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		if(FlxG.save.data.antialiasing)
			{
				bg.antialiasing = true;
			}
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.x = 0;
		magenta.scrollFactor.y = 0.10;
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		if(FlxG.save.data.antialiasing)
			{
				magenta.antialiasing = true;
			}
		magenta.color = 0xFFfd719b;
		add(magenta);
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var tex = Paths.getSparrowAtlas('FNF_main_menu_assets');

		for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite(0, FlxG.height * 1.6);
			menuItem.frames = tex;
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.screenCenter(X);
			menuItems.add(menuItem);
			menuItem.scrollFactor.set();
			if(FlxG.save.data.antialiasing)
				{
					menuItem.antialiasing = true;
				}
			if (firstStart)
			FlxTween.tween(menuItem,{y: 60 + (i * 230)},1 + (i * 0.25) ,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
				{ 
					finishedFunnyMove = true; 
					changeItem();
				}});
			else
				menuItem.y = 60 + (i * 230);
		}

		firstStart = false;

		FlxG.camera.follow(camFollow, null, 0.60 * (60 / FlxG.save.data.fpsCap));

		//var hiWuss:String = sys.Http.requestUrl("https://raw.githubusercontent.com/indigoUan/mods-version-shits/main/slenderman");

		var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, gameVer + " FNF - " + kadeEngineVer + " Kade Engine" + "  -  " + Localizations.mmwmVar/* + " - " + hiWuss*/, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		if (FlxG.save.data.isSwitched == true)
		{
			FlxG.save.data.upBind = FlxG.save.data.lastUp;
			FlxG.save.data.downBind = FlxG.save.data.lastDown;
			FlxG.save.data.leftBind = FlxG.save.data.lastLeft;
			FlxG.save.data.rightBind = FlxG.save.data.lastRight;
			if (FlxG.save.data.dfjk)
				controls.setKeyboardScheme(KeyboardScheme.Solo, true);
			else
				controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);
			
			FlxG.save.data.isSwitched = false;
		}

		staticAnimeshoun = new FlxSprite();
		staticAnimeshoun.frames = Paths.getSparrowAtlas('static/static');
		staticAnimeshoun.animation.addByPrefix('idle', 'idle', 24, true);
		staticAnimeshoun.screenCenter();
		staticAnimeshoun.scrollFactor.set();
		staticAnimeshoun.animation.play('idle');
		staticAnimeshoun.y = 1000;
		add(staticAnimeshoun);

		changeItem();

		if (TitleState.isGitHubNew != '0.0.2\n' && FlxG.save.data.gitWarning == true)
		{
			var githubWarn:FlxSprite = new FlxSprite(-360, 536).loadGraphic(Paths.image('github-warning'));
			githubWarn.antialiasing = true;
			githubWarn.scrollFactor.set();
			add(githubWarn);
			new FlxTimer().start(1 + (2 * 0.25), function(tmr:FlxTimer)
			{
				FlxTween.tween(githubWarn,{x: 0}, 1, {ease: FlxEase.expoInOut});

				new FlxTimer().start(4, function(tmr:FlxTimer)
				{
					FlxTween.tween(githubWarn,{x: -360}, 1, {ease: FlxEase.expoInOut});
				});
			});
		}

		super.create();
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (!selectedSomethin)
		{
			var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

			if (gamepad != null)
			{
				if (gamepad.justPressed.DPAD_UP)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					changeItem(-1);
				}
				if (gamepad.justPressed.DPAD_DOWN)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					changeItem(1);
				}
			}

			if (FlxG.keys.justPressed.UP)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (FlxG.keys.justPressed.DOWN)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (FlxG.keys.justPressed.P)
				FlxG.save.data.playjenSlender = 'pico';

			if (controls.BACK)
			{
				FlxTween.tween(staticAnimeshoun,{y: 0}, 1.2, {ease: FlxEase.expoInOut});
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				TitleState.fromMM = true;
				new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						FlxG.switchState(new TitleState());
					});
			}

		if (FlxG.keys.justPressed.ONE)
			{
				FlxG.save.data.hasSkipped = false;
				Localizations.languageVar = 'eng';
				Localizations.setLanguage();
				FlxG.switchState(new TitleState());
			}
	
			if (FlxG.keys.justPressed.TWO)
			{
				FlxG.save.data.hasSkipped = false;
				Localizations.languageVar = 'por';
				Localizations.setLanguage();
				FlxG.switchState(new TitleState());
			}
	
			if (FlxG.keys.justPressed.THREE)
			{
				FlxG.save.data.hasSkipped = false;
				Localizations.languageVar = 'esp';
				Localizations.setLanguage();
				FlxG.switchState(new TitleState());
			}
	
			if (FlxG.keys.justPressed.FOUR)
			{
				FlxG.save.data.hasSkipped = false;
				Localizations.languageVar = 'ita';
				Localizations.setLanguage();
				FlxG.switchState(new TitleState());
			}

			if (FlxG.keys.justPressed.FIVE)
			{
				FlxG.save.data.hasSkipped = false;
				Localizations.languageVar = 'fra';
				Localizations.setLanguage();
				FlxG.switchState(new TitleState());
			}
			
			if (FlxG.keys.justPressed.H)
			{
				FlxG.switchState(new HallofFameState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					fancyOpenURL("https://ninja-muffin24.itch.io/funkin");
				}
				else
				{
					selectedSomethin = true;

					if (optionShit[curSelected] == 'story mode' && FlxG.save.data.JumpScareSlender == true)
					{
						FlxG.sound.play(Paths.sound('REEE'));
						FlxTween.tween(staticAnimeshoun,{y: 0}, 0.001, {ease: FlxEase.expoInOut});
					}
					else
						FlxG.sound.play(Paths.sound('confirmMenu'));

					if (FlxG.save.data.flashing)
						FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 1.3, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							if (FlxG.save.data.flashing)
							{
								FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
								{
									goToState();
								});
							}
							else
							{
								new FlxTimer().start(1, function(tmr:FlxTimer)
								{
									goToState();
								});
							}
						}
					});
				}
			}
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.screenCenter(X);
		});

		if (FlxG.keys.justPressed.E)
		{
			if (lastCodeKey == 0)
				lastCodeKey = 1;
			else
				lastCodeKey = 99;
		}

		if (FlxG.keys.justPressed.G)
		{
			if (lastCodeKey == 1)
				lastCodeKey = 2;
			else
				lastCodeKey = 99;
		}

		if (FlxG.keys.justPressed.M)
		{
			if (lastCodeKey == 2)
				lastCodeKey = 3;
			else
				lastCodeKey = 99;
		}

		if (FlxG.keys.justPressed.O)
		{
			if (lastCodeKey == 3)
				lastCodeKey = 4;
			else
				lastCodeKey = 99;
		}

		if (FlxG.keys.justPressed.D)
		{
			if (lastCodeKey == 4)
			{
				lastCodeKey = 5;
				//FlxG.sound.play(Paths.sound('gunshot'));
				FlxG.switchState(new EggModeState());
				FlxG.save.data.hasEgg = true;
			}
			else
				lastCodeKey = 99;
		}
	}
	
	function goToState()
	{
		var daChoice:String = optionShit[curSelected];

		switch (daChoice)
		{
			case 'story mode':
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				FlxG.switchState(new StoryMenuState());

				trace("Story Menu Selected");
			case 'freeplay':
				FlxG.switchState(new FreeplayState());

				trace("Freeplay Menu Selected");

			case 'options':
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				FlxG.switchState(new OptionsMenu());
		}
	}

	function changeItem(huh:Int = 0)
	{
		if (finishedFunnyMove)
		{
			curSelected += huh;

			if (curSelected >= menuItems.length)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = menuItems.length - 1;
		}
		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected && finishedFunnyMove)
			{
				spr.animation.play('selected');
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
			}

			spr.updateHitbox();
		});
	}
}
