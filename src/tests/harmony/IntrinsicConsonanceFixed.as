package tests.harmony {
import eu.claudius.iacob.testing.abstracts.AbstractTest;
import eu.claudius.iacob.testing.interfaces.ITest;

public class IntrinsicConsonanceFixed extends AbstractTest implements ITest {

    private static const NAME : String = 'Intrinsic Consonance Fixed';
    private static const DESCRIPTION : String = 'Tests chords from Hindemith\'s table of chord classes and proofs that they receive the exact expected score. Note that scores are normalized as percents from `1` to `100`, where most consonant chords yeld `100`, whereas the most disonant ones receive `1`.';

    public function IntrinsicConsonanceFixed() {
        super (this, NAME, DESCRIPTION);
        testCases.push (

        );
    }
}
}
