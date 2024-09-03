package tests.melody.balance.common {
import eu.claudius.iacob.testing.abstracts.AbstractTestCase;
import eu.claudius.iacob.testing.common.TestingUtils;

import ro.ciacob.maidens.generators.core.AnalysisContext;

import ro.ciacob.maidens.generators.core.interfaces.IMusicRequest;

import ro.ciacob.maidens.generators.core.interfaces.IMusicUnit;
import ro.ciacob.maidens.generators.core.interfaces.IParametersList;
import ro.ciacob.maidens.generators.harmony.analyzers.MelodicProfile;
import ro.ciacob.maidens.generators.harmony.constants.ParameterNames;

import tests.common.Utils;

public class MelodyTestCase extends AbstractTestCase {
    public function MelodyTestCase (name:String, description:String) {
        super (this, name, description);
    }

    /**
     * MUST OVERRIDE.
     * Override and return a Vector of IMusicUnit implementers to be used for building the
     * analyzer's context.
     */
    protected function get previousContent () : Vector.<IMusicUnit> {
        TestingUtils.yieldStubMethodError(arguments.callee, this);
        return null;
    }

    /**
     * MUST OVERRIDE.
     * Override and return a Vector of one or more IMusicUnit implementers to be used as
     * `targetUnit` when running the analyzer.
     */
    protected function get testValues () : Vector.<IMusicUnit> {
        TestingUtils.yieldStubMethodError(arguments.callee, this);
        return null;
    }

    /**
     * MUST OVERRIDE.
     * Override and return a Boolean stating whether test should be considered PASSED or FAILED.
     *
     * @param   analyzerResults
     *          An ordered Array of uints representing the results produced by the analyzer for
     *          each of the provided test values, respectively.
     *
     * @param   data
     *          Miscellaneous information to aid in establishing whether test has passed or failed.
     */
    protected function assess (analyzerResults : Array, data : Object = null) : Boolean {
        TestingUtils.yieldStubMethodError(arguments.callee, this);
        return false;
    }

    /**
     * CAN OVERRIDE
     */
    override public function get expectedResult():String {
        return 'true';
    }

    /**
     * CAN OVERRIDE.
     * Override if you need to use other IMusicRequest implementer instance than the one defined
     * by tests.common.Utils.BASIC_MELODIC_MODEL_REQUEST.
     */
    protected function get request () : IMusicRequest {
        return Utils.BASIC_MELODIC_MODEL_REQUEST;
    }

    /**
     * CAN OVERRIDE
     * Override if you need to use other `percentTime` in your test context than the default
     * (which is 0.2, i.e., 20%).
     */
    protected function get percentTime () : Number {
        return 0.2;
    }

    /**
     * CAN OVERRIDE
     * Note: override only if you absolutely need full control over every details of the testing
     * procedure. However, if this is the case, you could just as well extend from `AbstractTestCase`
     * instead of `MelodyTestCase`.
     */
    override public function doTesting(reportBack:Function):void {
        var parameters:IParametersList = Utils.harmonyGeneratorParameters;

        // Context
        var context:AnalysisContext = new AnalysisContext;
        context.percentTime = percentTime;
        context.previousContent = previousContent;

        // Test values
        var testTargetUnits:Vector.<IMusicUnit> = testValues;

        // Actual testing
        var analyzer:MelodicProfile = new MelodicProfile;
        var analyzerResults:Array = [];
        for each (var targetUnit:IMusicUnit in testTargetUnits) {
            analyzer.analyze(targetUnit, context, parameters, request);
            analyzerResults.push(targetUnit.analysisScores.getValueFor(ParameterNames.MELODIC_DIRECTION_BALANCE));
        }
        reportBack (assess (analyzerResults, details));
    }
}
}
