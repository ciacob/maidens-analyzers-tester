package tests.melody.balance {
import ro.ciacob.maidens.generators.core.interfaces.IMusicUnit;

import tests.common.Utils;
import tests.melody.balance.common.MelodyTestCase;

public class BasicCase1 extends MelodyTestCase {
    private var _details : Object = {};

    public function BasicCase1() {
        super('Ideal melodic context ascending (1)',
                "The context is `C,D,E,F`, and the current unit is, in turn: `(0) B2, (1) A, (2) G, (3) F, (4) E, (5) D, (6) C, (7) B`. This test passes if 0 < 1 < 2 > 3 < 4 < 5 > 6 < 7");
    }

    override public function get details () : Object {
        return _details;
    }

    override protected function get previousContent():Vector.<IMusicUnit> {
        var content : Vector.<IMusicUnit> = Vector.<IMusicUnit>([Utils.C1, Utils.D1, Utils.E1, Utils.F1]);
        _details.previousContent = content;
        return content;
    }

    override protected function get testValues():Vector.<IMusicUnit> {
        var values : Vector.<IMusicUnit> = Vector.<IMusicUnit>([Utils.B2, Utils.A1, Utils.G1, Utils.F1, Utils.E1, Utils.D1, Utils.C1, Utils.B1]);
        _details.testValues = values;
        return values;
    }

    override protected function assess(analyzerResults:Array, data:Object = null):Boolean {
        _details.analyzerResults = analyzerResults;
        return (
                analyzerResults[0] < analyzerResults[1] &&
                analyzerResults[1] < analyzerResults[2] &&
                analyzerResults[2] > analyzerResults[3] &&
                analyzerResults[3] < analyzerResults[4] &&
                analyzerResults[4] < analyzerResults[5] &&
                analyzerResults[5] > analyzerResults[6] &&
                analyzerResults[6] < analyzerResults[7]
        );
    }
}
}
