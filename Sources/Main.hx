package;

import kha.Assets;
import kha.Color;
import kha.System;

class Main {

	public static function main() {
		System.start({title: "Highnoon", width: App.WIDTH, height: App.HEIGHT}, function (_) {
			// Just loading everything is ok for small projects
			Assets.loadEverything(App.onStart);
		});
	}
}
