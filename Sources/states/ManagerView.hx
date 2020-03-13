package states;

import kha.Canvas;

class ManagerView implements RenderState {

    public var ui:zui.Zui;
    public function new(){
        ui = new zui.Zui({font: kha.Assets.fonts.font_default,autoNotifyInput: false});
    }

    public function redrawUI(){

    }

    public function registerInput() {
        kha.input.Mouse.get().notify(onMouseDownMV, onMouseUpMV, onMouseMoveMV, onMouseWheelMV);
		kha.input.Keyboard.get().notify(onKeyDownMV, onKeyUpMV, onKeyPressMV);
		#if (kha_android || kha_ios)
		if (kha.input.Surface.get() != null) kha.input.Surface.get().notify(onTouchDownMV, onTouchUpMV, onTouchMoveMV);
		#end
    }
    public function unregisterInput() {
        kha.input.Mouse.get().remove(onMouseDownMV, onMouseUpMV, onMouseMoveMV, onMouseWheelMV);
		kha.input.Keyboard.get().remove(onKeyDownMV, onKeyUpMV, onKeyPressMV);
		#if (kha_android || kha_ios)
		if (kha.input.Surface.get() != null) kha.input.Surface.get().remove(onTouchDownMV, onTouchUpMV, onTouchMoveMV);
		#end
    }
    public function render(canvas:Canvas) {
        ui.begin(canvas.g2);

        ui.end();
    }
    function onMouseDownMV(button: Int, x: Int, y: Int) {
        ui.onMouseDown(button,x,y);
    }
    function onMouseUpMV(button: Int, x: Int, y: Int) {
        ui.onMouseUp(button,x,y);
    }
    function onMouseMoveMV(x: Int, y: Int, movementX: Int, movementY: Int) {
        ui.onMouseMove(x,y,movementX,movementY);
    }
    function onMouseWheelMV(delta: Int) {
        ui.onMouseWheel(delta);
    }
    function onKeyDownMV(code: kha.input.KeyCode) {
        ui.onKeyDown(code);
    }
    function onKeyUpMV(code: kha.input.KeyCode) {
        ui.onKeyUp(code);
    }
    function onKeyPressMV(char: String) {
        ui.onKeyPress(char);
    }

    #if (kha_android || kha_ios)
	function onTouchDownMV(index: Int, x: Int, y: Int) {
		// Two fingers down - right mouse button
		if (index == 1) { ui.onMouseDown(0, x, y); ui.onMouseDown(1, x, y); }
	}

	function onTouchUpMV(index: Int, x: Int, y: Int) {
		if (index == 1) ui.onMouseUp(1, x, y);
	}

	function onTouchMoveMV(index: Int, x: Int, y: Int) {}
	#end

}