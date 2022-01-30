import Sys.*;
import haxe.Json;
import sys.FileSystem.*;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	if (exists("docs")) Tools.removeDirectory("docs");

	command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	command("lix", [
		"run", "dox",
		"--define", "description", "Parse and format to LCOV your code coverage reports, in Haxe.",
		"--define", "source-path", "https://bitbucket.org/cedx/lcov.hx/src/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", Json.parse(getContent("haxelib.json")).version,
		"--define", "website", "https://bitbucket.org/cedx/lcov.hx",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "LCOV Reports for Haxe",
		"--toplevel-package", "lcov"
	]);

	copy("www/favicon.ico", "docs/favicon.ico");
}
