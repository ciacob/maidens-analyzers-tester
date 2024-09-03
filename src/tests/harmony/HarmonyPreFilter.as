package tests.harmony {
import ro.ciacob.maidens.generators.core.MusicUnit;
import ro.ciacob.maidens.generators.core.helpers.CommonMusicUtils;
import ro.ciacob.maidens.generators.harmony.analyzers.IntrinsicConsonance;
import ro.ciacob.maidens.generators.harmony.constants.ParameterNames;
import ro.ciacob.utils.Strings;

public class HarmonyPreFilter {
    public function HarmonyPreFilter() {
    }

    public static function get name():String {
        return 'Harmony Pre-filter';
    }

    private var tmp:Array = [
        {
            uid: Strings.UUID,
            name: 'Triad in root position, Do-Mi-Sol',
            description: '',
            pitches: [],
            result: NaN,
            executed: false,
            acceptanceCriteria: [
                {
                    description: 'Acceptable for score ' + CommonMusicUtils.TRIADS_WITH_ROOT_IN_BASS_SCORE,
                    functionName: '_isConsonanceAcceptable',
                    params: [
                        CommonMusicUtils.midiPitchesToMusicUnit([60, 64, 67]), // do-mi-sol
                        CommonMusicUtils.TRIADS_WITH_ROOT_IN_BASS_SCORE
                    ],
                    criterionPassed: false
                }
            ],
            acceptancePassed: undefined
        }
    ];

    private static var _testTemplate:Object = {
        uid: '',
        name: '',
        description: '',
        pitches: [],
        result: NaN,
        executed: false,
        acceptanceCriteria: [],
        acceptancePassed: undefined
    }

    private static var _criteriaTemplate:Object = {
        description: '',
        functionName: '',
        params: [],
        criterionPassed: false
    };

    private static var _testScoreNames:Array = [
        'TRIADS_WITH_ROOT_IN_BASS_SCORE',
        'TRIADS_WITH_ROOT_UPPER_SCORE',
        'ADDED_NOTES_CHORDS_ROOT_IN_BASS_SCORE',
        'ADDED_NOTES_CHORDS_ROOT_UPPER_SCORE',
        'DOMINANT_TRIAD_SCORE',
        'DOMINANT_INVERSIONS_ROOT_IN_BASS_SCORE',
        'DOMINANT_INVERSIONS_ROOT_UPPER_SCORE',
        'DOMINANT_NINTH_SCORE',
        'CLUSTERS_ROOT_IN_BASS_SCORE',
        'CLUSTERS_ROOT_UPPER_SCORE'
    ];

    private static var _testChords:Array = [
        {
            name: 'do-mi-sol',
            description: 'Without tritone, seconds or sevenths; root in bass; chord no. 1 (major triad)',
            pitches: [60, 64, 67]
        },
        {
            name: 'do-mib-sol',
            description: 'Without tritone, seconds or sevenths; root in bass; chord no. 2 (minor triad)',
            pitches: [60, 63, 67]
        },
        {
            name: 'do-do2-mi2-sol2',
            description: 'Without tritone, seconds or sevenths; root in bass; chord no. 1 (major triad WITH DOUBLING)',
            pitches: [48, 60, 64, 67]
        },
        {
            name: 'do-mib-lab',
            description: 'Without tritone, seconds or sevenths; root upper in chord; chord no. 1',
            pitches: [60, 63, 68]
        },
        {
            name: 'do-re-sol',
            description: 'Without tritone, with major seconds or minor sevenths; root in bass; chord no. 1',
            pitches: [60, 62, 67]
        },
        {
            name: 'do-re-fa',
            description: 'Without tritone, with major seconds and/or minor sevenths; root upper in chord; chord no. 1',
            pitches: [60, 62, 65]
        },
        {
            name: 'do-mi-sib',
            description: 'With one tritone and with minor seventh; root in bass; chord no. 1',
            pitches: [60, 64, 70]
        },
        {
            name: 'do-mi-sol-sib-re2',
            description: 'With one tritone, and with minor seventh and/or major second; root in bass; chord no. 1',
            pitches: [60, 64, 67, 70, 74]
        },
        {
            name: 'do-mib-solb-lab',
            description: 'With one tritone, and with minor seventh and/or major second; root upper in chord; chord no. 1',
            pitches: [60, 63, 66, 68]
        },
        {
            name: 'do-mi-fa#-la#',
            description: 'With several tritones, and with minor seventh and/or major seconds; chord no. 1',
            pitches: [60, 64, 66, 70]
        },
        {
            name: 'do-mi-sol-sib-reb',
            description: 'With several tritones, and with minor seconds and/or major sevenths; root in bass; chord no. 1',
            pitches: [60, 64, 67, 70, 73]
        },
        {
            name: 'do-mi-fa-sib-reb',
            description: 'With several tritones, and with minor seconds and/or major sevenths; root upper in chord; chord no. 2',
            pitches: [60, 64, 65, 70, 73]
        }
    ]

    private static var _tests:Array;

    private static function _haveSameStem(a:Number, b:Number):Boolean {
        return ((a == CommonMusicUtils.TRIADS_WITH_ROOT_IN_BASS_SCORE &&
                                b == CommonMusicUtils.TRIADS_WITH_ROOT_UPPER_SCORE)
                        || (a == CommonMusicUtils.TRIADS_WITH_ROOT_UPPER_SCORE &&
                                b == CommonMusicUtils.TRIADS_WITH_ROOT_IN_BASS_SCORE))
                ||
                ((a == CommonMusicUtils.ADDED_NOTES_CHORDS_ROOT_IN_BASS_SCORE &&
                                b == CommonMusicUtils.ADDED_NOTES_CHORDS_ROOT_UPPER_SCORE)
                        || (a == CommonMusicUtils.ADDED_NOTES_CHORDS_ROOT_UPPER_SCORE &&
                                b == CommonMusicUtils.ADDED_NOTES_CHORDS_ROOT_IN_BASS_SCORE))

                ||
                ((a == CommonMusicUtils.DOMINANT_INVERSIONS_ROOT_IN_BASS_SCORE &&
                                b == CommonMusicUtils.DOMINANT_INVERSIONS_ROOT_UPPER_SCORE)
                        || (a == CommonMusicUtils.DOMINANT_INVERSIONS_ROOT_UPPER_SCORE &&
                                b == CommonMusicUtils.DOMINANT_INVERSIONS_ROOT_IN_BASS_SCORE))
                ||
                ((a == CommonMusicUtils.CLUSTERS_ROOT_IN_BASS_SCORE &&
                                b == CommonMusicUtils.CLUSTERS_ROOT_UPPER_SCORE)
                        || (a == CommonMusicUtils.CLUSTERS_ROOT_UPPER_SCORE &&
                                b == CommonMusicUtils.CLUSTERS_ROOT_IN_BASS_SCORE));
    }

    public static function get TESTS():Array {
        if (_tests == null) {
            var consonanceAnalyzer:IntrinsicConsonance = new IntrinsicConsonance;
            _tests = [];
            for (var i:int = 0; i < _testChords.length; i++) {
                var testChord:Object = _testChords[i] as Object;
                var testPitches:Array = testChord.pitches as Array;
                var testMusicUnit:MusicUnit = CommonMusicUtils.midiPitchesToMusicUnit(testPitches) as MusicUnit;
                consonanceAnalyzer.analyze(testMusicUnit, null, null, null);
                var expectedScore:int = testMusicUnit.analysisScores.getValueFor(ParameterNames.INTRINSIC_CONSONANCE);

                // trace('>>>\n\n\nexpected score for', testChord.name, 'is:', expectedScore, '\n\n\n<<<');

                // Lower or equal scores are expected to pass; higher scores are expected to fail. One test per chord,
                // with one criteria per score.
                var test:Object = JSON.parse(JSON.stringify(_testTemplate)) as Object;
                test.uid = Strings.UUID;
                test.name = testChord.name;
                test.description = testChord.description + ' | EXPECTED SCORE: ' + expectedScore;
                for (var j:int = 0; j < _testScoreNames.length; j++) {
                    var testScoreName:String = _testScoreNames[j];
                    var printableScoreName:String = Strings.fromAS3ConstantCase(testScoreName);
                    var testScoreValue:Number = CommonMusicUtils[testScoreName];
                    var criteria:Object = JSON.parse(JSON.stringify(_criteriaTemplate)) as Object;
                    var isSameStem:Boolean = _haveSameStem(testScoreValue, expectedScore);
                    var shouldFail:Boolean = ((testScoreValue > expectedScore) && !isSameStem) ||
                            ((testScoreValue == CommonMusicUtils.DOMINANT_TRIAD_SCORE) &&
                                    ((expectedScore == CommonMusicUtils.ADDED_NOTES_CHORDS_ROOT_IN_BASS_SCORE) ||
                                            (expectedScore == CommonMusicUtils.ADDED_NOTES_CHORDS_ROOT_UPPER_SCORE)));
                    criteria.description = 'Should ' + (shouldFail ? 'fail' : 'pass') + ' for score ' + testScoreValue +
                            ' (' + printableScoreName + ')';
                    criteria.functionName = shouldFail ? '_isConsonanceNotAcceptable' : '_isConsonanceAcceptable';
                    criteria.params.push(testMusicUnit, testScoreValue);
                    test.acceptanceCriteria.push(criteria);
                }
                _tests.push(test);
            }
        }
        return _tests;
    }

}
}
