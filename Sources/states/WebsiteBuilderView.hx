package states;

class WebsiteBuilderView implements RenderState {

    var ui:zui.Zui;
    public function new(){
        ui = new zui.Zui({font: kha.Assets.fonts.font_default,autoNotifyInput: false});
    }
    public function registerInput() {
        kha.input.Mouse.get().notify(onMouseDownWBV, onMouseUpWBV, onMouseMoveWBV, onMouseWheelWBV);
		kha.input.Keyboard.get().notify(onKeyDownWBV, onKeyUpWBV, onKeyPressWBV);
		#if (kha_android || kha_ios)
		if (kha.input.Surface.get() != null) kha.input.Surface.get().notify(onTouchDownWBV, onTouchUpWBV, onTouchMoveWBV);
		#end
    }
    public function unregisterInput() {
        kha.input.Mouse.get().remove(onMouseDownWBV, onMouseUpWBV, onMouseMoveWBV, onMouseWheelWBV);
		kha.input.Keyboard.get().remove(onKeyDownWBV, onKeyUpWBV, onKeyPressWBV);
		#if (kha_android || kha_ios)
		if (kha.input.Surface.get() != null) kha.input.Surface.get().remove(onTouchDownWBV, onTouchUpWBV, onTouchMoveWBV);
		#end
    }
    public function render(canvas:Canvas) {
        ui.begin(canvas.g2);

        ui.end();
    }
    function onMouseDownWBV(button: Int, x: Int, y: Int) {
        ui.onMouseDown(button,x,y);
    }
    function onMouseUpWBV(button: Int, x: Int, y: Int) {
        ui.onMouseUp(button,x,y);
    }
    function onMouseMoveWBV(x: Int, y: Int, movementX: Int, movementY: Int) {
        ui.onMouseMove(x,y,movementX,movementY);
    }
    function onMouseWheelWBV(delta: Int) {
        ui.onMouseWheel(delta);
    }
    function onKeyDownWBV(code: kha.input.KeyCode) {
        ui.onKeyDown(code);
    }
    function onKeyUpWBV(code: kha.input.KeyCode) {
        ui.onKeyUp(code);
    }
    function onKeyPressWBV(char: String) {
        ui.onKeyPress(char);
    }

    #if (kha_android || kha_ios)
	function onTouchDownWBV(index: Int, x: Int, y: Int) {
		// Two fingers down - right mouse button
		if (index == 1) { ui.onMouseDown(0, x, y); ui.onMouseDown(1, x, y); }
	}

	function onTouchUpWBV(index: Int, x: Int, y: Int) {
		if (index == 1) ui.onMouseUp(1, x, y);
	}

	function onTouchMoveWBV(index: Int, x: Int, y: Int) {}
	#end

}