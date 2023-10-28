var score = [0, 15, 30, 40];

class Score {
    var score;
    var games;

    function initialize() {
        score = 0;
        games = [0];
    }
}
class ScoreBoard {
    var players;
    var tiebreak;
    var history;
    var replaying_history;
    
    function initialize() {
        reset();
    }

    function reset() {
        players = [new Score(), new Score()];
        tiebreak = false;
        replaying_history = false;
        history = [];
    }

    function addPoint(player) {
        if (! replaying_history) {
            history.add(player);
        }
        var scorer;
        var other;
        if (player == 1) {
            scorer = players[0] as Score;
            other = players[1] as Score;
        } else {
            scorer = players[1] as Score;
            other = players[0] as Score;

        }
        var score_needed = 3;
        if (tiebreak) {
            score_needed = 6;
        }
        if (scorer.score >= score_needed and scorer.score > other.score) {
            // someone one a game
            scorer.score = 0;
            other.score = 0;
            var current_game = scorer.games[scorer.games.size()-1];
            var other_game = other.games[scorer.games.size()-1];
            if ((current_game >= 5 and current_game > other_game) or tiebreak) {
                // we've won the set
                tiebreak = false;
                scorer.games[scorer.games.size()-1] += 1;
                scorer.games.add(0);
                other.games.add(0);
            } else {
                scorer.games[scorer.games.size()-1] += 1;
                // check if we are in tiebreaker
                if (other_game >= 6) {
                    tiebreak = true;
                    scorer.score = 0;
                    other.score = 0;
                }
            }
        } else {
            scorer.score += 1;
        }
    }

    function undoLast() {
        System.println("Undo last point");
        players = [new Score(), new Score()];
        tiebreak = false;
        history = history.slice(0, history.size() -1);
        replaying_history = true;
        for( var i = 0; i < history.size(); i += 1 ) {
            addPoint(history[i]);
        }
        replaying_history = false;
        return false;
    }

    function getScore(player) {
        var current_player = players[player - 1];
        var other_player = players[player % 2];
        if (! tiebreak) {
            if (current_player.score <= 3) {
                return score[current_player.score].toString();
            }
            if (current_player.score <= other_player.score) {
                return "40";
            }
            return "ADV";
        } else {
            return current_player.score.toString();
        }
    }

    function getGames(player) {
        var current_player = players[player - 1];
        var result = "";
        for( var i = 0; i < current_player.games.size(); i += 1 ) {
            result += current_player.games[i].toString() + " ";
        }
        return result;
    }
}