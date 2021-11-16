import Sys.*;

/** Runs the script. **/
function main() for (file in ["hl", "java", "js", "node", "php"]) {
	println('> Testing "$file" target...');
	command('haxe test_$file.hxml');
}
