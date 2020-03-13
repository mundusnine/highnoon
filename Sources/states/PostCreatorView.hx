package states;

import showdown.Showdown.Converter;
import kha.Canvas;
import zui.Zui.Handle;
import zui.Id;

class PostCreatorView implements RenderState {
    
    public var ui:zui.Zui;
    var converter:Converter;
    public function new(){
        ui = new zui.Zui({font: kha.Assets.fonts.font_default,autoNotifyInput: false});
        converter =  new Converter();
    }

    public function redrawUI(){

    }
    var markdownHandle:Handle = Id.handle();
    var htmlHandle:Handle = Id.handle();
    var window1:Handle = Id.handle();
    var window2:Handle = Id.handle();
    public function render(canvas:Canvas) {
        ui.t.FILL_WINDOW_BG = true;
        ui.begin(canvas.g2);
        var w = Std.int(App.WIDTH*0.5);
        var h = App.HEIGHT;
        if(ui.window(window1,0,0,w,h)){
            if(ui.button("Build Html")){
                htmlHandle.text = converter.makeHtml(markdownHandle.text);
                window2.redraws = 2;
            }
            zui.Ext.textArea(ui,markdownHandle);
        }
        if(ui.window(window2,w,0,w,h)){
            zui.Ext.textArea(ui,htmlHandle);
        }
        ui.end();
    }

    public function registerInput() {
        kha.input.Mouse.get().notify(onMouseDownPCV, onMouseUpPCV, onMouseMovePCV, onMouseWheelPCV);
		kha.input.Keyboard.get().notify(onKeyDownPCV, onKeyUpPCV, onKeyPressPCV);
		#if (kha_android || kha_ios)
		if (kha.input.Surface.get() != null) kha.input.Surface.get().notify(onTouchDownPCV, onTouchUpPCV, onTouchMovePCV);
		#end
    }
    public function unregisterInput() {
        kha.input.Mouse.get().remove(onMouseDownPCV, onMouseUpPCV, onMouseMovePCV, onMouseWheelPCV);
		kha.input.Keyboard.get().remove(onKeyDownPCV, onKeyUpPCV, onKeyPressPCV);
		#if (kha_android || kha_ios)
		if (kha.input.Surface.get() != null) kha.input.Surface.get().remove(onTouchDownPCV, onTouchUpPCV, onTouchMovePCV);
		#end
    }

    function onMouseDownPCV(button: Int, x: Int, y: Int) {
        ui.onMouseDown(button,x,y);
    }
    function onMouseUpPCV(button: Int, x: Int, y: Int) {
        ui.onMouseUp(button,x,y);
    }
    function onMouseMovePCV(x: Int, y: Int, movementX: Int, movementY: Int) {
        ui.onMouseMove(x,y,movementX,movementY);
    }
    function onMouseWheelPCV(delta: Int) {
        ui.onMouseWheel(delta);
    }
    function onKeyDownPCV(code: kha.input.KeyCode) {
        ui.onKeyDown(code);
    }
    function onKeyUpPCV(code: kha.input.KeyCode) {
        ui.onKeyUp(code);
    }
    function onKeyPressPCV(char: String) {
        ui.onKeyPress(char);
    }

    #if (kha_android || kha_ios)
	function onTouchDownPCV(index: Int, x: Int, y: Int) {
		// Two fingers down - right mouse button
		if (index == 1) { ui.onMouseDown(0, x, y); ui.onMouseDown(1, x, y); }
	}

	function onTouchUpPCV(index: Int, x: Int, y: Int) {
		if (index == 1) ui.onMouseUp(1, x, y);
	}

	function onTouchMovePCV(index: Int, x: Int, y: Int) {}
	#end

}