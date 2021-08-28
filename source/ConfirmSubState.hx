package;

import flixel.input.gamepad.FlxGamepad;
import haxe.Exception;
#if sys
import smTools.SMFile;
import sys.FileSystem;
import sys.io.File;
#end
import Controls.Control;
import openfl.geom.Matrix;
import openfl.display.BitmapData;
import flixel.system.FlxSound;
import flixel.util.FlxAxes;
import flixel.FlxSubState;
import Options.Option;
import flixel.input.FlxInput;
import flixel.input.keyboard.FlxKey;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import io.newgrounds.NG;
import lime.app.Application;
import lime.utils.Assets;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.input.FlxKeyManager;
import Controls.Control;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import Controls.KeyboardScheme;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;


using StringTools;

class ConfirmSubState extends FlxSubState
{
    public static var leave:Bool;
    public var background:FlxSprite;
    public var txt:FlxText;
    public var cant:FlxText;

    public var anotherBackground:FlxSprite;
    public var graph:HitGraph;
    public var graphSprite:OFLSprite;

	override function create()
	{	
        background = new FlxSprite(0,0).makeGraphic(FlxG.width,FlxG.height,FlxColor.BLACK);
        background.scrollFactor.set();
        add(background);

       //background.alpha = 0;


        if (leave)
            txt = new FlxText(0, 0, FlxG.width,
                "You wanna leave?\n\n(don't worry woops, I gotchu)\n\n\n\n\n[Y]/[N]",
                32);
        else
            txt = new FlxText(0, 0, FlxG.width,
                "You wanna restart?\n\n(don't worry woops, I gotchu)\n\n\n\n\n[Y]/[N]",
                32);
		
		txt.setFormat("VCR OSD Mono", 72, FlxColor.fromRGB(255, 0, 0), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
        txt.scrollFactor.set();
		txt.screenCenter();

        cant = new FlxText(0, 0, FlxG.width,
            "\n\n\n\n\n\n\n\n\ni cant do layering lol srry",
            32);
    
        cant.setFormat("VCR OSD Mono", 72, FlxColor.fromRGB(255, 255, 255), CENTER);
        cant.borderColor = FlxColor.BLACK;
        cant.borderSize = 3;
        cant.borderStyle = FlxTextBorderStyle.OUTLINE;
        cant.scrollFactor.set();
        cant.screenCenter();
        
		super.create();
	}

	override function update(elapsed:Float)
	{
		add(txt);
        add(cant);
        
        if (FlxG.keys.justPressed.N)
        {            
            close();
        }

        if (FlxG.keys.justPressed.Y)
        {            
            if (leave == true)
            {
                
                if (PlayState.isStoryMode)
                    FlxG.switchState(new StoryMenuState());
                else
                    FlxG.switchState(new FreeplayState());
            }

            else if (leave == false)
            {
                PlayState.startTime = 0;
                if (PlayState.instance.useVideo)
                {
                    GlobalVideo.get().stop();
                    PlayState.instance.remove(PlayState.instance.videoSprite);
                    PlayState.instance.removedVideo = true;
                }
                FlxG.resetState();
            }
        }

		super.update(elapsed);
	}
}
