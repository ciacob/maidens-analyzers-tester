package tests.melody.balance {
import ro.ciacob.maidens.generators.core.interfaces.IMusicUnit;
import ro.ciacob.maidens.generators.harmony.constants.ParameterCommons;

import tests.common.Utils;
import tests.melody.balance.common.MelodyTestCase;

public class RestsCase1 extends MelodyTestCase {
    private var _details : Object = {};

    public function RestsCase1() {
        super(
                'Context made of rests alone',
                'The context is made out of four single-voice rests, and the current unit is also a rest. This test passes if the analyzer returns the reserved value `0` (meaning "not applicable").'
        );
    }

    override public function get details () : Object {
        return _details;
    }

    override protected function get previousContent():Vector.<IMusicUnit> {
        var content : Vector.<IMusicUnit> = Vector.<IMusicUnit>([Utils.RestSingleVoice, Utils.RestSingleVoice, Utils.RestSingleVoice, Utils.RestSingleVoice]);
        _details.previousContent = content;
        return content;
    }

    override protected function get testValues():Vector.<IMusicUnit> {
        var values : Vector.<IMusicUnit> = Vector.<IMusicUnit>([Utils.RestSingleVoice]);
        _details.testValues = values;
        return values;
    }

    override protected function assess(analyzerResults:Array, data:Object = null):Boolean {
        _details.analyzerResults = analyzerResults;
        return (analyzerResults[0] === ParameterCommons.NA_RESERVED_VALUE);
    }
}
}
