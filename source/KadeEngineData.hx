import flixel.input.gamepad.FlxGamepad;
import openfl.Lib;
import flixel.FlxG;

class KadeEngineData
{
    public static function initSave()
    {
        if (FlxG.save.data.weekUnlocked == null)
			FlxG.save.data.weekUnlocked = 7;

		if (FlxG.save.data.newInput == null)
			FlxG.save.data.newInput = true;

		if (FlxG.save.data.downscroll == null)
			FlxG.save.data.downscroll = false;

		if (FlxG.save.data.antialiasing == null)
			FlxG.save.data.antialiasing = true;

		if (FlxG.save.data.missSounds == null)
			FlxG.save.data.missSounds = true;

		if (FlxG.save.data.dfjk == null)
			FlxG.save.data.dfjk = false;
			
		if (FlxG.save.data.accuracyDisplay == null)
			FlxG.save.data.accuracyDisplay = true;

		if (FlxG.save.data.offset == null)
			FlxG.save.data.offset = 0;

		if (FlxG.save.data.songPosition == null)
			FlxG.save.data.songPosition = false;

		if (FlxG.save.data.fps == null)
			FlxG.save.data.fps = false;

		if (FlxG.save.data.changedHit == null)
		{
			FlxG.save.data.changedHitX = -1;
			FlxG.save.data.changedHitY = -1;
			FlxG.save.data.changedHit = false;
		}

		if (FlxG.save.data.fpsRain == null)
			FlxG.save.data.fpsRain = false;

		if (FlxG.save.data.fpsCap == null)
			FlxG.save.data.fpsCap = 120;

		if (FlxG.save.data.fpsCap > 285 || FlxG.save.data.fpsCap < 60)
			FlxG.save.data.fpsCap = 120; // baby proof so you can't hard lock ur copy of kade engine
		
		if (FlxG.save.data.scrollSpeed == null)
			FlxG.save.data.scrollSpeed = 1;

		if (FlxG.save.data.npsDisplay == null)
			FlxG.save.data.npsDisplay = false;

		if (FlxG.save.data.frames == null)
			FlxG.save.data.frames = 10;

		if (FlxG.save.data.accuracyMod == null)
			FlxG.save.data.accuracyMod = 1;

		if (FlxG.save.data.watermark == null)
			FlxG.save.data.watermark = true;

		if (FlxG.save.data.ghost == null)
			FlxG.save.data.ghost = true;

		if (FlxG.save.data.distractions == null)
			FlxG.save.data.distractions = true;
		
		if (FlxG.save.data.stepMania == null)
			FlxG.save.data.stepMania = false;

		if (FlxG.save.data.flashing == null)
			FlxG.save.data.flashing = true;

		if (FlxG.save.data.resetButton == null)
			FlxG.save.data.resetButton = false;
		
		if (FlxG.save.data.botplay == null)
			FlxG.save.data.botplay = false;

		if (FlxG.save.data.cpuStrums == null)
			FlxG.save.data.cpuStrums = false;

		if (FlxG.save.data.strumline == null)
			FlxG.save.data.strumline = false;
		
		if (FlxG.save.data.customStrumLine == null)
			FlxG.save.data.customStrumLine = 0;

		if (FlxG.save.data.camzoom == null)
			FlxG.save.data.camzoom = true;

		if (FlxG.save.data.scoreScreen == null)
			FlxG.save.data.scoreScreen = true;

		if (FlxG.save.data.inputShow == null)
			FlxG.save.data.inputShow = false;

		if (FlxG.save.data.optimize == null)
			FlxG.save.data.optimize = false;
		
		if (FlxG.save.data.cacheImages == null)
			FlxG.save.data.cacheImages = false;

		if (FlxG.save.data.editor == null)
			FlxG.save.data.editor = true;

		if (FlxG.save.data.hitSound = null)
			FlxG.save.data.hitSound = true;

		//crits
		if (FlxG.save.data.critVar == null)
			FlxG.save.data.critVar = 10;

		// playing character
		if (FlxG.save.data.playjenSlender == null)
			FlxG.save.data.playjenSlender = 'bf';

		//week unlocked
		if (FlxG.save.data.completeWeekOneSlender == null)
			FlxG.save.data.completeWeekOneSlender = false;
		
		//hitsound
		if (FlxG.save.data.hitSound == null)
			FlxG.save.data.hitSound = true;

		//INVERT
		if (FlxG.save.data.isSwitched == null)
			FlxG.save.data.isSwitched = false;

		//filter
		if (FlxG.save.data.tvFilterSlender == null)
			FlxG.save.data.tvFilterSlender = true;

		if (FlxG.save.data.tvWhiteSlender == null)
			FlxG.save.data.tvWhiteSlender = true;

		if (FlxG.save.data.UIcamSlender == null)
			FlxG.save.data.UIcamSlender = true;

		if (FlxG.save.data.JumpScareSlender == null)
			FlxG.save.data.JumpScareSlender = true;

		if (FlxG.save.data.lastUp == null)
			FlxG.save.data.lastUp = FlxG.save.data.upBind;

		if (FlxG.save.data.lastDown == null)
			FlxG.save.data.lastDown = FlxG.save.data.downBind;

		if (FlxG.save.data.lastLeft == null)
			FlxG.save.data.lastLeft = FlxG.save.data.leftBind;

		if (FlxG.save.data.lastRight == null)
			FlxG.save.data.lastRight = FlxG.save.data.rightBind;

		//osu!mania
		if (FlxG.save.data.osuOverlay == null)
			FlxG.save.data.osuOverlay = true;

		//github notification
		if (FlxG.save.data.gitWarning == null)
			FlxG.save.data.gitWarning = true;

		//freeplay challenges lolmfaoxdrofl
		if (FlxG.save.data.canSwitch == null)
			FlxG.save.data.canSwitch = true;


		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
		
		KeyBinds.gamepad = gamepad != null;

		Conductor.recalculateTimings();
		PlayerSettings.player1.controls.loadKeyBinds();
		KeyBinds.keyCheck();

		Main.watermarks = FlxG.save.data.watermark;

		(cast (Lib.current.getChildAt(0), Main)).setFPSCap(FlxG.save.data.fpsCap);
	}
}