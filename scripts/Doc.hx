//! --class-path src --library tink_core
import lcov.Platform;
import sys.FileSystem;
import sys.io.File;
using Lambda;

/** Builds the documentation. **/
function main() {
	["CHANGELOG.md", "LICENSE.md"].iter(file -> File.copy(file, 'docs/${file.toLowerCase()}'));
	if (FileSystem.exists("docs/api")) Tools.removeDirectory("docs/api");

	Sys.command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	Sys.command("lix", ["run", "dox",
		"--define", "description", "Parse and format to LCOV your code coverage reports, in Haxe.",
		"--define", "source-path", "https://github.com/cedx/lcov.hx/blob/main/src",
		"--define", "themeColor", "0xea8220",
		"--define", "version", Platform.packageVersion,
		"--define", "website", "https://docs.belin.io/lcov.hx",
		"--input-path", "var",
		"--output-path", "docs/api",
		"--title", "LCOV Reports for Haxe",
		"--toplevel-package", "lcov"
	]);

	File.copy("docs/favicon.ico", "docs/api/favicon.ico");
}
