package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.graphics2.ImageScaleQuality;
import kha.Image;
import states.StateManager;

class App {

    public static inline function x(): Int { return 0; }
    public static inline function y(): Int { return 0; }
    
    public static var WIDTH(get, null):Int;
    static function get_WIDTH(){
        return width;
    }
    static var width:Int = 1280;
    public static var HEIGHT(get, null):Int;
    static function get_HEIGHT(){
        return height;
    }
    static var height:Int = 720;
    
    public static var BUFFERWIDTH(default, null):Int = WIDTH;
    public static var BUFFERHEIGHT(default, null):Int = HEIGHT;
    
    
    public static var backbuffer:Image;
    public static var backgroundcolor:kha.Color = kha.Color.Black;

    public static function onStart(){
        showdown.Showdown.Builder.addToHtml(function(){
            var test = js.Lib.global.module.exports;
            for(f in Reflect.fields(test)){
                trace(f);
            }
            Scheduler.addTimeTask(function () { update(); }, 0, 1 / 60);
            System.notifyOnFrames(function (frames:Array<Framebuffer>) { render(frames[0]); });
            kha.Window.get(0).notifyOnResize(resize);
            backbuffer = Image.createRenderTarget(BUFFERWIDTH,BUFFERHEIGHT);
            StateManager.addState(new states.ManagerView());
            StateManager.addState(new states.PostCreatorView());

            StateManager.active = StateManager.getState(States.PostCreatorView);
        });
    }
    static function update(){

    }
    static function render(canvas:kha.Canvas){

        
        if (StateManager.active != null){
            StateManager.active.render(backbuffer);
        }

        canvas.g2.color = backgroundcolor;
		canvas.g2.fillRect(0, 0, backbuffer.width,backbuffer.height);

        canvas.g2.begin();
		canvas.g2.imageScaleQuality = ImageScaleQuality.High;
		kha.Scaler.scale(backbuffer, canvas, System.screenRotation);
		canvas.g2.end();
    }
    static function resize(w:Int,h:Int){
        width = w;
        height = h;
        BUFFERWIDTH = w;
        BUFFERHEIGHT = h;
    }
}