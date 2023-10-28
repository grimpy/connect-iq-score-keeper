import Toybox.Lang;
import Toybox.WatchUi;

class scoreDelegate extends WatchUi.BehaviorDelegate {
    var mScoreboard;

    function initialize(scoreboard) {
        mScoreboard = scoreboard;
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new scoreMenuDelegate(mScoreboard), WatchUi.SLIDE_UP);
        return true;
    }

    function onKey(keyEvent) {
        if (keyEvent.getKey() == WatchUi.KEY_ENTER) {
            mScoreboard.addPoint(1);
        } else if (keyEvent.getKey() == WatchUi.KEY_ESC) {
            mScoreboard.addPoint(2);
        } else if (keyEvent.getKey() == WatchUi.KEY_UP) {
            System.println("key up pressed");
        } else if (keyEvent.getKey() == WatchUi.KEY_DOWN) {
            mScoreboard.undoLast();
        }
        WatchUi.requestUpdate();
        return true;
    }

}