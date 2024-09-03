package tests.melody.balance {
import ro.ciacob.maidens.generators.core.interfaces.IMusicUnit;

import tests.common.Utils;
import tests.melody.balance.common.MelodyTestCase;

public class PerfectPrimeCase1 extends MelodyTestCase {
    private var _details : Object = {};

    public function PerfectPrimeCase1() {
        super(
                'Repeated note with rest',
                'The context is `C,C,[rest],C,C,C`, and the current unit is `C`. This test passes if the result of the analyzer is NOT `100`, as this proves the penalties set to prevent "dull" melodies work correctly.'
        );
    }

    override public function get details () : Object {
        return _details;
    }

    override protected function get previousContent():Vector.<IMusicUnit> {
        var content : Vector.<IMusicUnit> = Vector.<IMusicUnit>([ Utils.C1, Utils.C1, Utils.RestSingleVoice, Utils.C1, Utils.C1, Utils.C1 ]);
        _details.previousContent = content;
        return content;
    }

    override protected function get testValues():Vector.<IMusicUnit> {
        var values : Vector.<IMusicUnit> = Vector.<IMusicUnit>([Utils.C1]);
        _details.testValues = values;
        return values;
    }

    override protected function assess(analyzerResults:Array, data:Object = null):Boolean {
        _details.analyzerResults = analyzerResults;
        // This mainly tests the repeated note penalty, a safety measure that encourages the
        // generated music to explore new pitches rather than repeating old ones, which increases the
        // ods for interesting/expressive music. If the penalty logic wasn't working, the returned
        // score would be `100`, due to a known weakness in the algorithm that calculates the ideal
        // pitch to follow in a given context.
        return (analyzerResults[0] != 100);
    }
}
}
