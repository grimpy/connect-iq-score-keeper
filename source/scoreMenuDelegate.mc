import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class scoreMenuDelegate extends WatchUi.MenuInputDelegate {
    var mScoreboard;

    function initialize(scoreboard) {
        mScoreboard = scoreboard;
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :reset) {
            System.println("Reset scoreboard");
            mScoreboard.reset();
        } else if (item == :player2) {
            System.println("item 2");
        }
    }

}