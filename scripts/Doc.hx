import haxe.Json;
import sys.FileSystem;
import sys.io.File;

/** Runs the script. **/
function main() {
	if (FileSystem.exists("docs")) Tools.removeDirectory("docs");

	Sys.command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	Sys.command("lix", [
		"run", "dox",
		"--define", "description", "Parse and format to LCOV your code coverage reports, in Haxe.",
		"--define", "source-path", "https://github.com/cedx/lcov.hx/blob/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", Json.parse(File.getContent("haxelib.json")).version,
		"--define", "website", "https://github.com/cedx/lcov.hx",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "LCOV Reports for Haxe",
		"--toplevel-package", "lcov"
	]);

	File.copy("www/favicon.ico", "docs/favicon.ico");
}
