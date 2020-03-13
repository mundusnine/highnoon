package states;

import zui.Zui;

interface RenderState {
    var ui:Zui;
    public function registerInput():Void;
    public function unregisterInput():Void;
    public function redrawUI():Void;

    public function render(canvas:kha.Canvas):Void;
}