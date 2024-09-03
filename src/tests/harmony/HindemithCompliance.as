package tests.harmony {
    import ro.ciacob.utils.Strings;

    public class HindemithCompliance {

        public static function get name () : String {
            return 'Hindemith Compliance';
        }
        public function HindemithCompliance() {
        }

        public static const TESTS:Array = [
            /*
            {
                uid: Strings.UUID,
                name: '',
                description: '',
                pitches: [],
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {description: '', functionName: '', params: [], criterionPassed: false}
                ],
                acceptancePassed: undefined
            }
            */
            {
                uid: Strings.UUID,
                name: 'I.1.1',
                description: 'Without tritone, seconds or sevenths; root in bass; chord no. 1 (major triad)',
                pitches: [60, 64, 67], // do-mi-sol
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'I.1.1 Must give max score',
                        functionName: '_isMaxScore',
                        params: [],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'I.1.2',
                description: 'Without tritone, seconds or sevenths; root in bass; chord no. 2 (minor triad)',
                pitches: [60, 63, 67], // do-mib-sol
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'I.1.2 Must give max score',
                        functionName: '_isMaxScore',
                        params: [],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'I.1.3',
                description: 'Without tritone, seconds or sevenths; root in bass; chord no. 1 (major triad WITH DOUBLING)',
                pitches: [48, 60, 64, 67], // do-do2-mi2-sol2
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'I.1.1 WITH DOUBLING. Must give max score',
                        functionName: '_isMaxScore',
                        params: [],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'I.2.1',
                description: 'Without tritone, seconds or sevenths; root upper in chord; chord no. 1',
                pitches: [60, 63, 68], // do-mib-lab
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'Score of I.2.1 must be less than score of I.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.1'],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },

            {
                uid: Strings.UUID,
                name: 'III.1.1',
                description: 'Without tritone, with major seconds or minor sevenths; root in bass; chord no. 1',
                pitches: [60, 62, 67], // do-re-sol
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'Score of III.1.1 must be less than score of I.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.1'],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'III.2.1',
                description: 'Without tritone, with major seconds and/or minor sevenths; root upper in chord; chord no. 1',
                pitches: [60, 62, 65], // do-re-fa
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'Score of III.2.1 must be less than score of I.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of III.2.1 must be less than score of III.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.1.1'],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'II.a.1.1',
                description: 'With one tritone and with minor seventh; root in bass; chord no. 1',
                pitches: [60, 64, 70], // do-mi-sib
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'Score of II.a.1.1 must be less than score of III.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.a.1.1 must be less than score of III.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.a.1.1 must be less than score of I.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.a.1.1 must be less than score of I.1.2',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.2'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.a.1.1 must be less than score of I.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.1'],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'II.b.1.1',
                description: 'With one tritone, and with minor seventh and/or major second; root in bass; chord no. 1',
                pitches: [60, 64, 67, 70, 74], // do-mi-sol-sib-re2
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'Score of II.b.1.1 must be less than score of II.a.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.a.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.1.1 must be less than score of III.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.1.1 must be less than score of III.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.1.1 must be less than score of I.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.1.1 must be less than score of I.1.2',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.2'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.1.1 must be less than score of I.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.1'],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'II.b.2.1',
                description: 'With one tritone, and with minor seventh and/or major second; root upper in chord; chord no. 1',
                pitches: [60, 63, 66, 68], // do-mib-solb-lab
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'Score of II.b.2.1 must be less than score of II.b.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.b.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.2.1 must be less than score of II.a.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.a.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.2.1 must be less than score of III.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.2.1 must be less than score of III.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.2.1 must be less than score of I.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.2.1 must be less than score of I.1.2',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.2'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.2.1 must be less than score of I.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.1'],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'II.b.3.1',
                description: 'With several tritones, and with minor seventh and/or major seconds; chord no. 1',
                pitches: [ 60, 64, 66, 70 ], // do-mi-fa#-la#
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'Score of II.b.3.1 must be less than score of II.b.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.b.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.3.1 must be less than score of II.b.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.b.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.3.1 must be less than score of II.a.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.a.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.3.1 must be less than score of III.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.3.1 must be less than score of III.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.3.1 must be less than score of I.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.3.1 must be less than score of I.1.2',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.2'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of II.b.3.1 must be less than score of I.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.1'],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'IV.1.1',
                description: 'With several tritones, and with minor seconds and/or major sevenths; root in bass; chord no. 1',
                pitches: [60, 64, 67, 70, 73], // do-mi-sol-sib-reb
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'Score of IV.1.1 must be less than score of II.b.3.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.b.3.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.1.1 must be less than score of II.b.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.b.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.1.1 must be less than score of II.b.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.b.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.1.1 must be less than score of II.a.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.a.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.1.1 must be less than score of III.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.1.1 must be less than score of III.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.1.1 must be less than score of I.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.1.1 must be less than score of I.1.2',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.2'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.1.1 must be less than score of I.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.1'],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'IV.2.2',
                description: 'With several tritones, and with minor seconds and/or major sevenths; root upper in chord; chord no. 2',
                pitches: [60, 64, 65, 70, 73], // do-mi-fa-sib-reb
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'Score of IV.2.2 must be less than score of IV.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['IV.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.2.2 must be less than score of II.b.3.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.b.3.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.2.2 must be less than score of II.b.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.b.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.2.2 must be less than score of II.b.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.b.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.2.2 must be less than score of II.a.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['II.a.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.2.2 must be less than score of III.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.2.2 must be less than score of III.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['III.1.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.2.2 must be less than score of I.2.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.2.1'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.2.2 must be less than score of I.1.2',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.2'],
                        criterionPassed: false
                    },
                    {
                        description: 'Score of IV.2.2 must be less than score of I.1.1',
                        functionName: '_isScoreLessThan',
                        params: ['I.1.1'],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'V.1',
                description: 'Augmented chord',
                pitches: [60, 64, 68], // do-mi-sol#
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'V.1 Must give half score',
                        functionName: '_isAugmentedOrQuartalScore',
                        params: [],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'V.2',
                description: 'Quartal chord',
                pitches: [60, 65, 70], // do-fa-sib
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'V.2 Must give half score',
                        functionName: '_isAugmentedOrQuartalScore',
                        params: [],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'VI.1',
                description: 'Diminished chord root position',
                pitches: [60, 63, 66], // do-mib-solb
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'VI.1 Must give half score',
                        functionName: '_isDiminishedScore',
                        params: [],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'VI.2',
                description: 'Diminished chord first inversion',
                pitches: [60, 63, 69], // do-mib-la
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'VI.2 Must give half score',
                        functionName: '_isDiminishedScore',
                        params: [],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'VI.3',
                description: 'Diminished chord second inversion',
                pitches: [60, 66, 69], // do-fa#-la
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'VI.3 Must give half score',
                        functionName: '_isDiminishedScore',
                        params: [],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            },
            {
                uid: Strings.UUID,
                name: 'VI.4',
                description: 'Diminished seventh chord, first inversion',
                pitches: [60, 63, 66, 69], // do-mib-solb-la
                result: NaN,
                executed: false,
                acceptanceCriteria: [
                    {
                        description: 'VI.4 Must give half score',
                        functionName: '_isDiminishedScore',
                        params: [],
                        criterionPassed: false
                    }
                ],
                acceptancePassed: undefined
            }
        ];
    }
}
