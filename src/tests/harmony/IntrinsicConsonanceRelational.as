package tests.harmony {
import eu.claudius.iacob.testing.abstracts.AbstractTest;
import eu.claudius.iacob.testing.interfaces.ITest;

public class IntrinsicConsonanceRelational extends AbstractTest implements ITest {

    private static const NAME : String = 'Intrinsic Consonance Relational';
    private static const DESCRIPTION : String = 'Tests chords from Hindemith\'s table of chord classes and proofs that received scores are relationally correct, e.g., a chord containing seconds/sevenths/tritones should yield a score smaller than a chord that doesn\'t.';
    public function IntrinsicConsonanceRelational() {
        super (this, NAME, DESCRIPTION);
        testCases.push (

        );
    }
}
}
