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

class DialogueState extends MusicBeatState
{
	public var curSection:Int = 1;
	public static var curWeek:Int = 0;
	public static var curPlaylist:Array<String> = [];
	public static var curDifficulty:Int = 1;

	//WEEK 1 VARS
	public var week1images:FlxSprite;
	public var week1d1:FlxText;
	public var week1d2:FlxText;
	public var week1d3:FlxText;
	public var week1d4:FlxText;
	public var week1d5:FlxText;
	public var week1d6:FlxText;
	public var week1d7:FlxText;
	public var week1d8:FlxText;
	public var week1d9:FlxText;
	public var week1d10:FlxText;

	override function create()
	{
		super.create();
		
		//WEEK 1 STUFF LOL
		week1images = new FlxSprite();
		week1images.frames = Paths.getSparrowAtlas('cutscenes/cut_test');
		week1images.animation.addByPrefix('img1', 'one', 24, true);
		week1images.animation.addByPrefix('img2', 'two', 24, true);
		week1images.screenCenter();
		week1images.scrollFactor.set();
		week1images.antialiasing = false;
		week1images.animation.play('img1', true);

		switch (curWeek)
		{
			case 0:
				add(week1images);
		}
		
		//INSTRUCTION
		var versionShit:FlxText = new FlxText(5, FlxG.height - 34, 0,
			"Press [SPACE] to go forth"
			+ "            "
			+ "Press [S] to skip dialogue"
			+ "            "
			+ "Press [ESC] to return to the story menu"
			, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("Arial", 28, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		versionShit.antialiasing = true;
		add(versionShit);
	}

	override function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.SPACE)
			nextDial();

		if (FlxG.keys.justPressed.S)
			skipDial();

		if (controls.BACK)
			FlxG.switchState(new StoryMenuState());

		super.update(elapsed);
	}

	function skipDial()
	{
		PlayState.storyPlaylist = /*weekData()[*/curPlaylist/*]*/;
		PlayState.isStoryMode = true;
		//selectedWeek = true;


		PlayState.storyDifficulty = curDifficulty;

		// adjusting the song name to be compatible
		var songFormat = StringTools.replace(PlayState.storyPlaylist[0], " ", "-");
		switch (songFormat) {
			case 'Dad-Battle': songFormat = 'Dadbattle';
			case 'Philly-Nice': songFormat = 'Philly';
		}

		var poop:String = Highscore.formatSong(songFormat, curDifficulty);
		PlayState.sicks = 0;
		PlayState.bads = 0;
		PlayState.shits = 0;
		PlayState.goods = 0;
		PlayState.campaignMisses = 0;
		PlayState.SONG = Song.loadFromJson(poop, PlayState.storyPlaylist[0]);
		PlayState.storyWeek = curWeek;
		PlayState.campaignScore = 0;
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			LoadingState.loadAndSwitchState(new PlayState(), true);
		});
	}

	function nextDial():Void
	{
		switch (curWeek)
		{
			default:
				switch (curSection)
				{
					default:
						justPlay();
					}
			case 0:
				switch (curSection)
				{
					default:
						curSection = curSection + 1;
						week1images.animation.play('img' + curSection);
					case 2:
						justPlay();
				}
		}
	}

	public function justPlay():Void
	{
		PlayState.storyPlaylist = /*weekData()[*/curPlaylist/*]*/;
		PlayState.isStoryMode = true;
		//selectedWeek = true;


		PlayState.storyDifficulty = curDifficulty;

		// adjusting the song name to be compatible
		var songFormat = StringTools.replace(PlayState.storyPlaylist[0], " ", "-");
		switch (songFormat) {
			case 'Dad-Battle': songFormat = 'Dadbattle';
			case 'Philly-Nice': songFormat = 'Philly';
		}

		var poop:String = Highscore.formatSong(songFormat, curDifficulty);
		PlayState.sicks = 0;
		PlayState.bads = 0;
		PlayState.shits = 0;
		PlayState.goods = 0;
		PlayState.campaignMisses = 0;
		PlayState.SONG = Song.loadFromJson(poop, PlayState.storyPlaylist[0]);
		PlayState.storyWeek = curWeek;
		PlayState.campaignScore = 0;
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			LoadingState.loadAndSwitchState(new PlayState(), true);
		});
	}
}