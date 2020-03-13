package states;

import kha.Canvas;

enum abstract States(Int) from Int to Int {
    var ManagerView;
    var WebsiteBuilderView=2;
    var PostCreatorView=1;
}

class StateManager {
    public static var active(default,set):RenderState = null;
    static function set_active(r:RenderState){
        if(active != null)
            active.unregisterInput();
        r.registerInput();
        return active = r;
    }
    public static function addState(r:RenderState){
        states.push(r);
    }
    public static function getState(s:States){
        return states[s];
    }
    private static final states:Array<RenderState> = [];
}