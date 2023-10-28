import Toybox.Graphics;
import Toybox.WatchUi;

class scoreView extends WatchUi.View {

    hidden var mScoreboard;

    function initialize(scoreboard) {
        mScoreboard = scoreboard;
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        var v1 = View.findDrawableById("score1") as Text;
        var v2 = View.findDrawableById("score2") as Text;
        var g1 = View.findDrawableById("games1") as Text;
        var g2 = View.findDrawableById("games2") as Text;
        var time = View.findDrawableById("time") as Text;
        v1.setText(mScoreboard.getScore(1));
        v2.setText(mScoreboard.getScore(2));
        g1.setText(mScoreboard.getGames(1));
        g2.setText(mScoreboard.getGames(2));
        var myTime = System.getClockTime();
        time.setText(myTime.hour.format("%02d") + ":" + myTime.min.format("%02d"));
        System.print("update");
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
