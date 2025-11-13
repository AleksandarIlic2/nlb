package si.nlb.testautomation.NLBTestAutomation.Data;

public class SCDynamicStore {
    public native String copyComputerName();
    static {
        //System.loadLibrary("SCDynamicStore");
    }
}
