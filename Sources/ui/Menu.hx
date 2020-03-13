package ui;

import haxe.io.Bytes;
import haxe.Json;
import kha.System;
import kha.Image;

import zui.Zui;
import zui.Id;
import zui.Ext;

import system.Input;
import states.StateManager;

enum abstract MenuItems(Int) from Int to Int {
    var MenuFile;
    var MenuEdit;
    var MenuMode;
    var MenuHelp;
}

class Menu {

	public static var show = false;
	public static var menuCategory = 0;
	public static var menuX = 0;
	public static var menuY = 0;
	public static var menuElements = 0;
	public static var keepOpen = false;
    public static var menuCommands: Zui->Array<Int>->Void = null;
    public static var menuItems:Array<Int>;
	static var changeStarted = false;
	static var showMenuFirst = true;
	static var hideMenu = false;

	@:access(zui.Zui)
	public static function render(g: kha.graphics2.Graphics) {
		var ui = StateManager.active.ui;
		var menuW = Std.int(ui.ELEMENT_W() * 2.0);
		var BUTTON_COL = ui.t.BUTTON_COL;
		ui.t.BUTTON_COL = ui.t.SEPARATOR_COL;
		var ELEMENT_OFFSET = ui.t.ELEMENT_OFFSET;
		ui.t.ELEMENT_OFFSET = 0;
		var ELEMENT_H = ui.t.ELEMENT_H;
		ui.t.ELEMENT_H = 28;
		
		ui.beginRegion(g, menuX, menuY, menuW);

		if (menuCommands != null) {
			ui.fill(0, 0, ui._w / ui.SCALE(), ui.t.ELEMENT_H * menuElements, ui.t.SEPARATOR_COL);
			menuCommands(ui,menuItems);
		}
		else {
			// var menuItems = [12, 3, 14, #if kha_direct3d12 13 #else 12 #end, 19, 5];
			var sepw = menuW / ui.SCALE();
			g.color = ui.t.SEPARATOR_COL;
			g.fillRect(menuX, menuY, menuW, 28 * menuItems[menuCategory] * ui.SCALE());

			if (menuCategory == MenuFile) {
				// if (ui.button("      New Project...", Left, Config.keymap.file_new)) Project.projectNewBox();
				// if (ui.button("      Open...", Left, Config.keymap.file_open)) Project.projectOpen();
				// if (ui.button("      Save", Left, Config.keymap.file_save)) Project.projectSave();
				// if (ui.button("      Save As...", Left, Config.keymap.file_save_as)) Project.projectSaveAs();
				// ui.fill(0, 0, sepw, 1, ui.t.ACCENT_SELECT_COL);
				// if (ui.button("      Import Texture...", Left, Config.keymap.file_import_assets)) Project.importAsset(Path.textureFormats.join(","));
				// if (ui.button("      Import Font...", Left)) Project.importAsset("ttf");
				// if (ui.button("      Import Material...", Left)) Project.importMaterial();
				// if (ui.button("      Import Mesh...", Left)) Project.importMesh();
				// if (ui.button("      Reimport Mesh", Left, Config.keymap.file_reimport_mesh)) Project.reimportMesh();
				// ui.fill(0, 0, sepw, 1, ui.t.ACCENT_SELECT_COL);
                // if (ui.button("      Export Website...", Left, Config.keymap.file_export_textures_as));
                // if (ui.button("      Export Post...", Left, Config.keymap.file_export_textures_as));
				// ui.fill(0, 0, sepw, 1, ui.t.ACCENT_SELECT_COL);
				// if (ui.button("      Exit", Left)) System.stop();
			}
			else if (menuCategory == MenuEdit) {
				// var stepUndo = "";
				// var stepRedo = "";
				// if (History.undos > 0) {
				// 	stepUndo = History.steps[History.steps.length - 1 - History.redos].name;
				// }
				// if (History.redos > 0) {
				// 	stepRedo = History.steps[History.steps.length - History.redos].name;
				// }
				// ui.enabled = History.undos > 0;
				// if (ui.button("      Undo " + stepUndo, Left, Config.keymap.edit_undo)) History.undo();
				// ui.enabled = History.redos > 0;
				// if (ui.button("      Redo " + stepRedo, Left, Config.keymap.edit_redo)) History.redo();
				// ui.enabled = true;
				// ui.fill(0, 0, sepw, 1, ui.t.ACCENT_SELECT_COL);
				// if (ui.button("      Preferences...", Left, Config.keymap.edit_prefs)) BoxPreferences.show();
			}
			else if (menuCategory == MenuMode) {
				// var modeHandle = Id.handle();
				// var modes = ["Render", "Base Color", "Normal", "Occlusion", "Roughness", "Metallic", "Opacity", "TexCoord", "Normal (Object)", "Material ID", "Object ID", "Mask"];
				// #if kha_direct3d12
				// modes.push("Path Trace");
				// #end
				// for (i in 0...modes.length) {
				// 	ui.radio(modeHandle, i, modes[i]);
				// }

				// UITrait.inst.viewportMode = modeHandle.position;
				// if (modeHandle.changed) {
				// 	var deferred = UITrait.inst.viewportMode == ViewRender || UITrait.inst.viewportMode == ViewPathTrace;
				// 	if (deferred) {
				// 		RenderPath.active.commands = RenderPathDeferred.commands;
				// 	}
				// 	else {
				// 		if (RenderPathForward.path == null) RenderPathForward.init(RenderPath.active);
				// 		RenderPath.active.commands = RenderPathForward.commands;
				// 	}
				// 	MaterialParser.parseMeshMaterial();
				// }
			}
			else if (menuCategory == MenuHelp) {
				// if (ui.button("      Manual", Left)) {
				// 	File.explorer("https://armorpaint.org/manual");
				// }
				// if (ui.button("      Issue Tracker", Left)) {
				// 	File.explorer("https://github.com/armory3d/armorpaint/issues");
				// }
				// if (ui.button("      Report Bug", Left)) {
				// 	var ver = App.version;
				// 	var sha = BuildMacros.sha();
				// 	sha = sha.substr(1, sha.length - 2);
				// 	var os = System.systemId;
				// 	var url = "https://github.com/armory3d/armorpaint/issues/new?labels=bug&template=bug_report.md&body=*ArmorPaint%20" + ver + "-" + sha + ",%20" + os + "*";
				// 	File.explorer(url);
				// }
				// if (ui.button("      Check for Updates...", Left)) {
				// 	// Retrieve latest version number
				// 	var url = "'https://luboslenco.gitlab.io/armorpaint/index.html'";
				// 	var blob = File.downloadBytes(url);
				// 	if (blob != null)  {
				// 		// Compare versions
				// 		var update = Json.parse(blob.toString());
				// 		var updateVersion = Std.int(update.version);
				// 		if (updateVersion > 0) {
				// 			var date = BuildMacros.date().split(" ")[0].substr(2); // 2019 -> 19
				// 			var dateInt = Std.parseInt(date.replace("-", ""));
				// 			if (updateVersion > dateInt) {
				// 				UIBox.showMessage("Update", "Update is available!\nPlease visit armorpaint.org to download.");
				// 			}
				// 			else {
				// 				UIBox.showMessage("Update", "You are up to date!");
				// 			}
				// 		}
				// 	}
				// 	else {
				// 		UIBox.showMessage("Update", "Unable to check for updates.\nPlease visit armorpaint.org.");
				// 	}
				// }
				// if (ui.button("      About...", Left)) {
				// 	var sha = BuildMacros.sha();
				// 	sha = sha.substr(1, sha.length - 2);
				// 	var date = BuildMacros.date().split(" ")[0];
				// 	var gapi = #if (kha_direct3d11) "Direct3D11" #elseif (kha_direct3d12) "Direct3D12" #else "OpenGL" #end;
				// 	var msg = "ArmorPaint.org - v" + App.version + " (" + date + ") - " + sha + "\n";
				// 	msg += System.systemId + " - " + gapi;

				// 	#if krom_windows
				// 	var save = (Path.isProtected() ? Krom.savePath() : Path.data()) + Path.sep + "tmp.txt";
				// 	Krom.sysCommand('wmic path win32_VideoController get name > "' + save + '"');
				// 	var bytes = haxe.io.Bytes.ofData(Krom.loadBlob(save));
				// 	var gpu = "";
				// 	for (i in 30...Std.int(bytes.length / 2)) {
				// 		var c = String.fromCharCode(bytes.get(i * 2));
				// 		if (c == "\n") continue;
				// 		gpu += c;
				// 	}
				// 	msg += '\n$gpu';
				// 	#else
				// 	// { lshw -C display }
				// 	#end

				// 	UIBox.showMessage("About", msg, true);
				// }
			}
		}

		var first = showMenuFirst;
		hideMenu = ui.comboSelectedHandle == null && !changeStarted && !keepOpen && !first && (ui.changed || ui.inputReleased || ui.inputReleasedR || ui.isEscapeDown);
		showMenuFirst = false;
		keepOpen = false;
		if (ui.inputReleased) changeStarted = false;

		ui.t.BUTTON_COL = BUTTON_COL;
		ui.t.ELEMENT_OFFSET = ELEMENT_OFFSET;
		ui.t.ELEMENT_H = ELEMENT_H;
		ui.endRegion();
	}

	public static function update() {
		//var ui = App.uimenu;
		if (hideMenu) {
			show = false;
			StateManager.active.redrawUI();
			showMenuFirst = true;
			menuCommands = null;
		}
	}

	public static function draw(commands: Zui->Array<Int>->Void = null, elements: Int, x = -1, y = -1) {
		show = true;
		menuCommands = commands;
		menuElements = elements;
		menuX = x > -1 ? x : Std.int(Input.getMouse().x);
		menuY = y > -1 ? y : Std.int(Input.getMouse().y);
		var menuW = StateManager.active.ui.ELEMENT_W() * 2.0;
		if (menuX + menuW > System.windowWidth()) {
			menuX = Std.int(System.windowWidth() - menuW);
		}
		var menuH = menuElements * 28; // ui.t.ELEMENT_H
		if (menuY + menuH > System.windowHeight()) {
			menuY = System.windowHeight() - menuH;
			menuX += 1; // Move out of mouse focus
		}
	}
}
