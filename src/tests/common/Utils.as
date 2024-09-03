package tests.common {
import ro.ciacob.maidens.generators.core.MusicPitch;
import ro.ciacob.maidens.generators.core.MusicRequest;
import ro.ciacob.maidens.generators.core.MusicUnit;
import ro.ciacob.maidens.generators.core.SettingsList;
import ro.ciacob.maidens.generators.core.interfaces.IMusicPitch;
import ro.ciacob.maidens.generators.core.interfaces.IMusicRequest;
import ro.ciacob.maidens.generators.core.interfaces.IMusicUnit;
import ro.ciacob.maidens.generators.core.interfaces.IParameter;
import ro.ciacob.maidens.generators.core.interfaces.IParametersList;
import ro.ciacob.maidens.generators.core.interfaces.ISettingsList;
import ro.ciacob.maidens.generators.harmony.HarmonyGenerator;
import ro.ciacob.maidens.generators.harmony.constants.ParameterNames;
import ro.ciacob.math.Fraction;
import ro.ciacob.math.IFraction;

public class Utils {

    private static var _harmonyGenerator : HarmonyGenerator;
    public function Utils() {}

    public static function makePitch (midiNumber : uint) : IMusicPitch {
        var pitch : IMusicPitch = new MusicPitch();
        pitch.midiNote = midiNumber;
        return pitch;
    }

    public static function makeUnit (duration : IFraction, ...pitches) : IMusicUnit {
        var unit : IMusicUnit = new MusicUnit();
        unit.duration = duration;
        for (var i : int = 0; i < pitches.length; i++) {
            var pitch : IMusicPitch = (pitches[i] as IMusicPitch);
            if (pitch) {
                unit.pitches.push (pitch);
            }
        }
        return unit;
    }

    public static function get harmonyGeneratorParameters () : IParametersList {
        if (!_harmonyGenerator) {
            _harmonyGenerator = new HarmonyGenerator;
        }
        return _harmonyGenerator.parametersList;
    }

    public static function getHarmonyParameter (parameterName : String) : IParameter {
        return harmonyGeneratorParameters.getByName(parameterName)[0];
    }

    /**
     * Convenience way of building a `MusicRequest` instance to be passed along to
     * `<Analyzer>.analyze()` calls.
     * @param   triplets
     *          Array of Arrays of three values, representing, respectively:
     *          [0] A Parameter (IParameter);
     *          [1] a percent time (uint, 1 to 100);
     *          [2] a value (uint, or Number, valid values depend on parameter type).
     *
     * @return The MusicRequest built.
     */
    public static function buildRequest (triplets : Array) : IMusicRequest {
        var settings : ISettingsList = new SettingsList;
        for (var i : int = 0; i < triplets.length; i++) {
            var triplet : Array = (triplets[i] as Array);
            var parameter : IParameter = (triplet[0] as IParameter);
            var percentTime : uint = (triplet[1] as uint);
            var value : Object = (triplet[2] as Object);
            settings.setValueAt(parameter, percentTime, value);
        }
        var request : IMusicRequest = new MusicRequest;
        request.userSettings = settings;
        return request;
    }

    public static const PARAM_USE_MELODIC_MODEL : IParameter = getHarmonyParameter(ParameterNames.USE_MELODIC_MODEL);

    public static const BASIC_MELODIC_MODEL_REQUEST : IMusicRequest = buildRequest([
            [PARAM_USE_MELODIC_MODEL, 1, 1]
    ]);

    public static const nullPitch : IMusicPitch = makePitch(0);
    public static const bPitch : IMusicPitch = makePitch (59);
    public static const cPitch : IMusicPitch = makePitch (60);
    public static const dPitch : IMusicPitch = makePitch (62);
    public static const ePitch : IMusicPitch = makePitch (64);
    public static const fPitch : IMusicPitch = makePitch (65);
    public static const gPitch : IMusicPitch = makePitch (67);
    public static const aPitch : IMusicPitch = makePitch (69);
    public static const b2Pitch : IMusicPitch = makePitch (71);


    public static const B1 : IMusicUnit = makeUnit(Fraction.WHOLE, bPitch);
    public static const C1 : IMusicUnit = makeUnit(Fraction.WHOLE, cPitch);
    public static const D1 : IMusicUnit = makeUnit(Fraction.WHOLE, dPitch);
    public static const E1 : IMusicUnit = makeUnit(Fraction.WHOLE, ePitch);
    public static const F1 : IMusicUnit = makeUnit(Fraction.WHOLE, fPitch);
    public static const G1 : IMusicUnit = makeUnit(Fraction.WHOLE, gPitch);
    public static const A1 : IMusicUnit = makeUnit(Fraction.WHOLE, aPitch);
    public static const B2 : IMusicUnit = makeUnit(Fraction.WHOLE, b2Pitch);
    public static const RestSingleVoice : IMusicUnit = makeUnit(Fraction.WHOLE);

}
}
