package;

#if sys
import smTools.SMFile;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
#if newgrounds
import io.newgrounds.NG;
#end
import lime.app.Application;
import openfl.Assets;
import Controls.KeyboardScheme;

#if windows
import Discord.DiscordClient;
#end

#if cpp
import sys.thread.Thread;
#end

using StringTools;

class TitleState extends MusicBeatState
{
	public static var isGitHubNew:String = sys.Http.requestUrl("https://raw.githubusercontent.com/indigoUan/slenderman-datas/main/is%20new%20github");
	
	//public var buildVar:String = sys.Http.requestUrl("https://raw.githubusercontent.com/indigoUan/mods-version-shits/main/slenderman");
	public var buildVar:String = sys.Http.requestUrl("https://raw.githubusercontent.com/indigoUan/slenderman-datas/main/last%20private%20build");
	public var buildNew:String = sys.Http.requestUrl("https://raw.githubusercontent.com/indigoUan/slenderman-datas/main/new%20shit");

	public var twistedRight:Bool = false;

	public var beatDuration:Float = (Conductor.bpm / 60) - 1;

	public static var fromMM:Bool = false;

	public var twistedTimes:Float = 0;

	public var logoStop:Bool = false;

	public var staticAnimeshoun:FlxSprite;
	
	public var gfDance:FlxSprite;
	public var logoBl:FlxSprite;
	public var titleText:FlxSprite;

	static var initialized:Bool = false;

	var blackScreen:FlxSprite;
	var credGroup:FlxGroup;
	var credTextShit:Alphabet;
	var textGroup:FlxGroup;
	var ngSpr:FlxSprite;

	var oneSpr:FlxSprite;
	var twoSpr:FlxSprite;
	var threeSpr:FlxSprite;
	var fourSpr:FlxSprite;
	var fiveSpr:FlxSprite;
	var sixSpr:FlxSprite;
	var sevenSpr:FlxSprite;
	var eightSpr:FlxSprite;
	var nineSpr:FlxSprite;
	var tenSpr:FlxSprite;
	var elevenSpr:FlxSprite;
	var twelveSpr:FlxSprite;
	var thirteenSpr:FlxSprite;
	var fourteenSpr:FlxSprite;

	// nicoly drogada e noia
	var wackyImage:FlxSprite;

	override public function create():Void
	{
		#if polymod
//		polymod.Polymod.init({modRoot: "mods", dirs: ['introMod']});
		#end
		
		/*#if sys
		if (!sys.FileSystem.exists(Sys.getCwd() + "/assets/replays"))
			sys.FileSystem.createDirectory(Sys.getCwd() + "/assets/replays");
		#end*/

		@:privateAccess
		{
			trace("Loaded " + openfl.Assets.getLibrary("default").assetsLoaded + " assets (DEFAULT)");
		}
		
		#if !cpp

		FlxG.save.bind('funkin', 'ninjamuffin99');

		PlayerSettings.init();

		KadeEngineData.initSave();
		
		#end

				
		Highscore.load();

		trace('hello');

		// DEBUG BULLSHIT

		super.create();

		// NGio.noLogin(APIStuff.API);

		#if ng
		var ng:NGio = new NGio(APIStuff.API, APIStuff.EncKey);
		trace('NEWGROUNDS LOL');
		#end

		#if FREEPLAY
		FlxG.switchState(new FreeplayState());
		#elseif CHARTING
		FlxG.switchState(new ChartingState());
		#else
		#if !cpp
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			startIntro();
		});
		#else
		startIntro();
		#end
		#end

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
	}

	var danceLeft:Bool = false;

	function startIntro()
	{
		persistentUpdate = true;

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		// bg.antialiasing = true;
		// bg.setGraphicSize(Std.int(bg.width * 0.6));
		// bg.updateHitbox();
		add(bg);

		staticAnimeshoun = new FlxSprite();
		staticAnimeshoun.frames = Paths.getSparrowAtlas('static/static');
		staticAnimeshoun.animation.addByPrefix('idle', 'idle', 24, true);
		staticAnimeshoun.screenCenter();
		staticAnimeshoun.scrollFactor.set();
		staticAnimeshoun.animation.play('idle');

		var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('title to menu transition BG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		//bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;

		add(bg);
		add(staticAnimeshoun);
		
		logoBl = new FlxSprite(50, -600);
		logoBl.frames = Paths.getSparrowAtlas('logoBumpin');

		if(FlxG.save.data.antialiasing)
			{
				logoBl.antialiasing = true;
			}
		logoBl.animation.addByPrefix('bump', 'logo bumpin', 24, false);
		logoBl.updateHitbox();
		// logoBl.screenCenter();
		// logoBl.color = FlxColor.BLACK;

		gfDance = new FlxSprite(FlxG.width * 0.4, FlxG.height * 0.07);
		gfDance.frames = Paths.getSparrowAtlas('gfDanceTitle');
		gfDance.animation.addByIndices('danceLeft', 'gfDance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		gfDance.animation.addByIndices('danceRight', 'gfDance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		if(FlxG.save.data.antialiasing)
			{
				gfDance.antialiasing = true;
			}
		//add(gfDance);
		//add(logoBl);

		titleText = new FlxSprite(100, FlxG.height * 0.8);
		titleText.frames = Paths.getSparrowAtlas('titleEnter');
		titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
		titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
		if(FlxG.save.data.antialiasing)
			{
				titleText.antialiasing = true;
			}
		titleText.animation.play('idle');
		titleText.updateHitbox();
		// titleText.screenCenter(X);

		var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('logo'));
		logo.screenCenter();
		if(FlxG.save.data.antialiasing)
			{
				logo.antialiasing = true;
			}
		// add(logo);

		// FlxTween.tween(logoBl, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG});
		// FlxTween.tween(logo, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		//credGroup.add(blackScreen);
		credGroup.add(credTextShit);

		credTextShit = new Alphabet(0, 0, "ninjamuffin99\nPhantomArcade\nkawaisprite\nevilsk8er", true);
		credTextShit.screenCenter();

		// credTextShit.alignment = CENTER;
		// niceeeeeeeeeeee

		credTextShit.visible = false;

		var ngSpr:FlxSprite = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('newgrounds_logo'));
		add(ngSpr);
		ngSpr.visible = false;
		ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.8));
		ngSpr.updateHitbox();
		ngSpr.screenCenter(X);
		ngSpr.antialiasing = true;

		var oneSpr:FlxSprite = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/flamin"));
		add(oneSpr);
		oneSpr.visible = false;
		oneSpr.setGraphicSize(Std.int(oneSpr.width * 0.8));
		oneSpr.updateHitbox();
		oneSpr.screenCenter(X);
		oneSpr.antialiasing = true;

		var twoSpr:FlxSprite = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/uan"));
		add(twoSpr);
		twoSpr.visible = false;
		twoSpr.setGraphicSize(Std.int(twoSpr.width * 0.8));
		twoSpr.updateHitbox();
		twoSpr.screenCenter(X);
		twoSpr.antialiasing = true;

		var threeSpr:FlxSprite = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/canon"));
		add(threeSpr);
		threeSpr.visible = false;
		threeSpr.setGraphicSize(Std.int(threeSpr.width * 0.8));
		threeSpr.updateHitbox();
		threeSpr.screenCenter(X);
		threeSpr.antialiasing = true;

		var fourSpr:FlxSprite = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/waw"));
		add(fourSpr);
		fourSpr.visible = false;
		fourSpr.setGraphicSize(Std.int(fourSpr.width * 0.8));
		fourSpr.updateHitbox();
		fourSpr.screenCenter(X);
		fourSpr.antialiasing = true;

		var fiveSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/spooky"));
		add(fiveSpr);
		fiveSpr.visible = false;
		fiveSpr.setGraphicSize(Std.int(fiveSpr.width * 0.8));
		fiveSpr.updateHitbox();
		fiveSpr.screenCenter(X);
		fiveSpr.antialiasing = true;

		sixSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/tiago"));
		add(sixSpr);
		sixSpr.visible = false;
		sixSpr.setGraphicSize(Std.int(sixSpr.width * 0.8));
		sixSpr.updateHitbox();
		sixSpr.screenCenter(X);
		sixSpr.antialiasing = true;

		sevenSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/select"));
		add(sevenSpr);
		sevenSpr.visible = false;
		sevenSpr.setGraphicSize(Std.int(sevenSpr.width * 0.8));
		sevenSpr.updateHitbox();
		sevenSpr.screenCenter(X);
		sevenSpr.antialiasing = true;

		eightSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/eze"));
		add(eightSpr);
		eightSpr.visible = false;
		eightSpr.setGraphicSize(Std.int(eightSpr.width * 0.8));
		eightSpr.updateHitbox();
		eightSpr.screenCenter(X);
		eightSpr.antialiasing = true;

		nineSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/vibra"));
		add(nineSpr);
		nineSpr.visible = false;
		nineSpr.setGraphicSize(Std.int(nineSpr.width * 0.8));
		nineSpr.updateHitbox();
		nineSpr.screenCenter(X);
		nineSpr.antialiasing = true;

		tenSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/blu"));
		add(tenSpr);
		tenSpr.visible = false;
		tenSpr.setGraphicSize(Std.int(tenSpr.width * 0.8));
		tenSpr.updateHitbox();
		tenSpr.screenCenter(X);
		tenSpr.antialiasing = true;

		elevenSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/heavy"));
		add(elevenSpr);
		elevenSpr.visible = false;
		elevenSpr.setGraphicSize(Std.int(elevenSpr.width * 0.8));
		elevenSpr.updateHitbox();
		elevenSpr.screenCenter(X);
		elevenSpr.antialiasing = true;

		twelveSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/slime"));
		add(twelveSpr);
		twelveSpr.visible = false;
		twelveSpr.setGraphicSize(Std.int(twelveSpr.width * 0.8));
		twelveSpr.updateHitbox();
		twelveSpr.screenCenter(X);
		twelveSpr.antialiasing = true;

		thirteenSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/meshy"));
		add(thirteenSpr);
		thirteenSpr.visible = false;
		thirteenSpr.setGraphicSize(Std.int(thirteenSpr.width * 0.8));
		thirteenSpr.updateHitbox();
		thirteenSpr.screenCenter(X);
		thirteenSpr.antialiasing = true;

		fourteenSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("sprs/intro/fimbu"));
		add(fourteenSpr);
		fourteenSpr.visible = false;
		fourteenSpr.setGraphicSize(Std.int(fourteenSpr.width * 0.8));
		fourteenSpr.updateHitbox();
		fourteenSpr.screenCenter(X);
		fourteenSpr.antialiasing = true;

		FlxTween.tween(credTextShit, {y: credTextShit.y + 20}, 2.9, {ease: FlxEase.quadInOut, type: PINGPONG});

		FlxG.mouse.visible = false;

		if (initialized)
			skipIntro();
		else {
			var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;

			FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32},
				new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
			FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1),
				{asset: diamond, width: 32, height: 32}, new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));

			transIn = FlxTransitionableState.defaultTransIn;
			transOut = FlxTransitionableState.defaultTransOut;

			// HAD TO MODIFY SOME BACKEND SHIT
			// IF THIS PR IS HERE IF ITS ACCEPTED UR GOOD TO GO
			// https://github.com/HaxeFlixel/flixel-addons/pull/348

			// var music:FlxSound = new FlxSound();
			// music.loadStream(Paths.music('freakyMenu'));
			// FlxG.sound.list.add(music);
			// music.play();
			FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);

			FlxG.sound.music.fadeIn(4, 0, 0.7);
			Conductor.changeBPM(100);
			initialized = true;
		}

		// credGroup.add(credTextShit);
	}

	var transitioning:Bool = false;

	override function update(elapsed:Float)
	{		
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		// FlxG.watch.addQuick('amp', FlxG.sound.music.amplitude);

		if (FlxG.keys.justPressed.F)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}

		var pressedEnter:Bool = controls.ACCEPT;

		#if mobile
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				pressedEnter = true;
			}
		}
		#end

		if (pressedEnter && !transitioning && skippedIntro)
		{       #if newgrounds
			#if !switch
			NGio.unlockMedal(60960);

			// If it's Friday according to da clock
			if (Date.now().getDay() == 5)
				NGio.unlockMedal(61034);
			#end
                        #end
			logoStop = true;
			FlxTween.tween(logoBl,{y: 200}, 0.8, {ease: FlxEase.expoInOut});
			FlxTween.angle(logoBl, logoBl.angle, 180, 0.8, {ease: FlxEase.quartInOut});
			new FlxTimer().start(0.8, function(tmr:FlxTimer)
			{
				FlxTween.tween(logoBl,{y: -600}, 1.2, {ease: FlxEase.expoInOut});
				FlxTween.angle(logoBl, logoBl.angle, -545, 1.2, {ease: FlxEase.quartInOut});

				FlxTween.tween(staticAnimeshoun,{y: 1000}, 1.2, {ease: FlxEase.expoInOut});
				
				new FlxTimer().start(1.2, function(tmr:FlxTimer)
				{
					logoBl.kill();
				});
			});

			if (FlxG.save.data.flashing)
				titleText.animation.play('press');

			FlxG.camera.flash(FlxColor.WHITE, 0.8);
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

			transitioning = true;
			// FlxG.sound.music.stop();

			MainMenuState.firstStart = true;
			MainMenuState.finishedFunnyMove = false;

			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;

				if (buildVar != '1\n')
				{
					trace (buildVar);
					FlxG.switchState(new OutdatedSubState());
				}
				else
					FlxG.switchState(new MainMenuState());
			});
		}

		if (pressedEnter && !skippedIntro && initialized)
		{
			skipIntro();
		}

		super.update(elapsed);
	}

	function createCoolText(textArray:Array<String>)
	{
		for (i in 0...textArray.length)
		{
			var money:Alphabet = new Alphabet(0, 0, textArray[i], true, false);
			money.screenCenter(X);
			money.y += (i * 60) + 200;
			credGroup.add(money);
			textGroup.add(money);
		}
	}

	function addMoreText(text:String)
	{
		var coolText:Alphabet = new Alphabet(0, 0, text, true, false);
		coolText.screenCenter(X);
		coolText.y += (textGroup.length * 60) + 200;
		credGroup.add(coolText);
		textGroup.add(coolText);
	}

	function deleteCoolText()
	{
		while (textGroup.members.length > 0)
		{
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}

	override function beatHit()
	{
		super.beatHit();

		trace (beatDuration);

		trace (twistedTimes);

		if(twistedRight == true && logoStop == false && twistedTimes != 10)
		{
			FlxTween.angle(logoBl, logoBl.angle, 3, 0.001, {ease: FlxEase.quartInOut});
			twistedRight = false;
			twistedTimes += 1;
		}
		else if (twistedRight == false && logoStop == false && twistedTimes != 10) 
		{
			FlxTween.angle(logoBl, logoBl.angle, -3, 0.001, {ease: FlxEase.quartInOut});
			twistedRight = true;
			twistedTimes += 1;
		}
		else if (twistedRight == true && logoStop == false && twistedTimes == 10) 
		{
			FlxTween.angle(logoBl, logoBl.angle, -363, (Conductor.bpm / 60) / 10, {ease: FlxEase.quartInOut});
			twistedRight = true;
			twistedTimes -= 10;
		}
		else if (twistedRight == false && logoStop == false && twistedTimes == 10) 
		{
			FlxTween.angle(logoBl, logoBl.angle, 363, (Conductor.bpm / 60) / 10, {ease: FlxEase.quartInOut});
			twistedRight = false;
			twistedTimes -= 10;
		}

		logoBl.animation.play('bump', true);
		danceLeft = !danceLeft;

		if (danceLeft)
			gfDance.animation.play('danceRight');
		else
			gfDance.animation.play('danceLeft');

		FlxG.log.add(curBeat);

		switch (curBeat)
		{
			case 0:
				deleteCoolText();
			case 1:
				addMoreText('mr flamin');
				oneSpr.visible = true;
			case 2:
				oneSpr.visible = false;
				deleteCoolText();
				addMoreText('indigo');
				twoSpr.visible = true;
			case 3: 
				twoSpr.visible = false;
				deleteCoolText();
				addMoreText('canondev');
				threeSpr.visible = true;
			case 4: 
				threeSpr.visible = false;
				deleteCoolText();
				addMoreText('select');
				sevenSpr.visible = true;
			case 5: 
				sevenSpr.visible = false;
				deleteCoolText();
				addMoreText('ezekiel');
				eightSpr.visible = true;
			case 6:
				eightSpr.visible = false;
				deleteCoolText();
				addMoreText('vibrativev');
				nineSpr.visible = true;
			case 7:
				nineSpr.visible = false;
				deleteCoolText();
				addMoreText('leftblumusic');
				tenSpr.visible = true;
			case 8: 
				tenSpr.visible = false;
				deleteCoolText();
				addMoreText('slime guy');
				twelveSpr.visible = true;
			case 9:
				twelveSpr.visible = false;
				deleteCoolText();
				addMoreText(Localizations.lovinMem);
			case 11:
				addMoreText('');
				addMoreText('marcelo');
			case 12:
				deleteCoolText();
			case 13:
				addMoreText('vs');
			case 14:
				addMoreText('slenderman');
			case 15:
				addMoreText(Localizations.proxyTxt);
				//addMoreText(curEnd[2]);

			case 16:
				skipIntro();
		}
	}

	var skippedIntro:Bool = false;

	function skipIntro():Void
	{
		if (!skippedIntro)
		{
			
			//add(gfDance);
			add(logoBl);
			//add(titleText);

			remove(ngSpr);

			remove(oneSpr);
			remove(twoSpr);
			remove(threeSpr);
			remove(fourSpr);
			remove(fiveSpr);
			remove(sixSpr);
			remove(sevenSpr);
			remove(eightSpr);
			remove(nineSpr);
			remove(tenSpr);
			remove(elevenSpr);
			remove(twelveSpr);
			remove(thirteenSpr);

			if (fromMM == false)
				FlxG.camera.flash(FlxColor.WHITE, 2.4);
	
			remove(credGroup);

			FlxTween.tween(logoBl,{x: 50, y: 200}, 1.4, {ease: FlxEase.expoInOut});

			new FlxTimer().start(1.4, function(tmr:FlxTimer)
				{
					FlxTween.tween(logoBl,{y: 0}, 1, {ease: FlxEase.expoInOut});
				});

			logoBl.angle = -3;

			/*new FlxTimer().start(0.06, function(tmr:FlxTimer)
				{
					if(logoBl.angle == -4) 
						FlxTween.angle(logoBl, logoBl.angle, 4, 1, {ease: FlxEase.quartInOut});
					if (logoBl.angle == 4) 
						FlxTween.angle(logoBl, logoBl.angle, -4, 1, {ease: FlxEase.quartInOut});
				}, 0);*/

			skippedIntro = true;
		}
	}
}
