import haxe.DynamicAccess;
using StringTools;

#if php
import php.Global.is_array;
import php.Global.isset;
import php.JsonSerializable;
import php.Lib.toHaxeArray;
import php.Lib.toPhpArray;
import php.NativeIndexedArray;
import php.NativeStructArray;
#end
