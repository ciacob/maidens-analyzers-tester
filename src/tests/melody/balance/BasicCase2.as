package tests.melody.balance {
import ro.ciacob.maidens.generators.core.interfaces.IMusicUnit;

import tests.common.Utils;
import tests.melody.balance.common.MelodyTestCase;

public class BasicCase2 extends MelodyTestCase {
    private var _details : Object = {};

    public function BasicCase2() {
        super(
                "Ideal melodic context ascending (2)",
                "The context is `F, G, A, B2`, and the current unit is, in turn: `(0) G, (1) F, (2) E, (3) D, (4) C, (5) B`. This test passes if 0 > 1 < 2 < 3 > 4 > 5"
        );
    }

    override public function get details () : Object {
        return _details;
    }

    override protected function get previousContent():Vector.<IMusicUnit> {
        var content : Vector.<IMusicUnit> = Vector.<IMusicUnit>([Utils.F1, Utils.G1, Utils.A1, Utils.B2]);
        details.previousContent = content;
        return content;
    }

    override protected function get testValues():Vector.<IMusicUnit> {
        var values : Vector.<IMusicUnit> = Vector.<IMusicUnit>([Utils.G1, Utils.F1, Utils.E1, Utils.D1, Utils.C1, Utils.B1]);
        _details.testValues = values;
        return values;
    }

    override protected function assess(analyzerResults:Array, data:Object = null):Boolean {
        _details.analyzerResults = analyzerResults;
        return (
                analyzerResults[0] > analyzerResults[1] &&
                analyzerResults[1] < analyzerResults[2] &&
                analyzerResults[2] < analyzerResults[3] &&
                analyzerResults[3] > analyzerResults[4] &&
                analyzerResults[4] > analyzerResults[5]
        );
    }
}
}
