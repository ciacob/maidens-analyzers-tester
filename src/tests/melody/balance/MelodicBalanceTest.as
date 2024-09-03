package tests.melody.balance {
import eu.claudius.iacob.testing.abstracts.AbstractTest;
import eu.claudius.iacob.testing.interfaces.ITest;

public class MelodicBalanceTest extends AbstractTest implements ITest {

    private static const NAME : String = 'Melodic Balance';
    private static const DESCRIPTION : String = 'Tests tendency of ascending melodies to descend in order to balance out (and vice versa).';
    public function MelodicBalanceTest() {
        super (this, NAME, DESCRIPTION);
    }
}
}
