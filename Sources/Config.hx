package;

import kha.Blob;
import haxe.Json;

class Config {
    public static var keymap:Dynamic; 
    public function new(){
        loadKeymap();
    }
    public static function loadKeymap() {
		kha.Assets.loadBlobFromPath("default.json", function(blob: kha.Blob) { // Sync
			keymap = Json.parse(blob.toString());
		});
	}
}