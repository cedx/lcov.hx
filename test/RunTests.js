import {writeFile} from "node:fs/promises";
import {createServer} from "node:http";
import {dirname, join} from "node:path";
import {fileURLToPath} from "node:url";
import {chromium} from "playwright";
import handler from "serve-handler";

// Start the application.
(async function main() {
	await writeFile(new URL("../var/tests.html", import.meta.url), [
		'<!DOCTYPE html>',
		'<html dir="ltr" lang="en">',
		'\t<head><meta charset="UTF-8"/></head>',
		'\t<body><script src="tests.js"></script></body>',
		'</html>'
	].join("\n"));

	const directory = dirname(fileURLToPath(import.meta.url));
	const server = createServer((req, res) => handler(req, res, {public: join(directory, "../var")}));
	server.listen(8080);

	const browser = await chromium.launch();
	const page = await browser.newPage();
	page.on("console", message => console.log(message.text()));
	page.on("pageerror", error => console.error(error));

	await page.exposeFunction("exit", code => {
		process.exitCode = code;
		server.close();
		return browser.close();
	});

	await page.evaluate(() => console.info(navigator.userAgent));
	await page.goto("http://localhost:8080/tests.html");
})();
