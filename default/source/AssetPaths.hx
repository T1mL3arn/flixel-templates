package;

/**
 * Helper class to access asset paths in a type-safe manner.
 * 
 * **NOTE:** this class is created when you use [`flixel template` command](https://haxeflixel.com/documentation/hello-world/#create-a-new-haxeflixel-project).
 * 
 * `AssetPaths`'s static fields are autogenerated by a neat [Haxe macro](http://haxe.org/manual/macro.html) 
 * from the contents of [Project.xml's `<assets>`](https://lime.openfl.org/docs/project-files/xml-format/#assets) 
 * tag, so you can easily reference them in your code:
 * 
 * ```haxe
 * // Play sound effect using AssetPaths
 * FlxG.sound.play(AssetPaths.mySound__wav);
 * // instead of using string path
 * FlxG.sound.play("assets/sounds/mySound.wav");
 * ```
 * 
 * Static fields available on `AssetPaths` will change whenever you add, remove, rename or move a file. 
 * If you remove a file that is still referenced via `AssetPaths` you'll get a compile error, 
 * this could be handy compared to using string paths, which only cause a runtime error if the file is missing.
 * 
 * ## Ignored Assets
 * 
 * In some cases `AssetPaths` will ignore your assets. You will get a warning at compile time when:
 * 
 * - File names do not match Haxe valid id pattern, e.g. starting with a digit.
 * 
 * 	A file `assets/1.ogg` won't appear on `AssetPaths` since you cannot do `AssetPaths.1__ogg` in Haxe.
 * 	If you don't want to rename the file you have to use it as a string.
 * 
 * 	```haxe
 * 	FlxG.sound.play("assets/1.ogg");
 * 
 * 	// this wont work
 * 	// FlxG.sound.play(AssetPaths.1__ogg);
 * 	// assets/1.ogg:1: character 1 : Warning : Invalid name: 1__ogg for file: assets/1.ogg
 * 	```
 * 
 * - Duplicate file names.
 * 
 * 	If you have assets with the same file names, whichever file is nested deeper or found later 
 * 	will be ignored.
 * 
 * 	```haxe
 * 	// assets folder:
 * 	// assets/music/hero.ogg
 * 	// assets/sounds/hero.ogg
 * 
 * 	// prints "assets/music/hero.ogg"
 * 	trace(AssetPaths.hero__ogg);
 * 	// assets/sounds/hero.ogg:1: character 1 : Warning : Duplicate files named "hero__ogg" ignoring assets/sounds/hero.ogg
 * 	```
 * 
 * @see [FlxAssets.buildFileReferences()](https://api.haxeflixel.com/flixel/system/FlxAssets.html#buildFileReferences) is used by `AssetPaths` 
 * and provides you some control on how `AssetPaths`'s fields are built.
 * @see [Flixel 5.0.0 Migration guide - AssetPaths has less caveats](https://github.com/HaxeFlixel/flixel/wiki/Flixel-5.0.0-Migration-guide#assetpaths-has-less-caveats-2575)
**/
@:build(flixel.system.FlxAssets.buildFileReferences("assets", true))
class AssetPaths {}
