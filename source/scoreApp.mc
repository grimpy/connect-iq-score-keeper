import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class scoreApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        var scoreboard = new ScoreBoard();
        return [ new scoreView(scoreboard), new scoreDelegate(scoreboard) ] as Array<Views or InputDelegates>;
    }

}

function getApp() as scoreApp {
    return Application.getApp() as scoreApp;
}