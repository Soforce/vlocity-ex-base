public with sharing class vLogger {
    @TestVisible
    private static Boolean isLogging = true;
    static {
        vlocity_cmt__CpqConfigurationSetup__c cpqSetup = vlocity_cmt__CpqConfigurationSetup__c.getInstance('SoforceLogging');
        if (Test.isRunningTest() || (cpqSetup != null && cpqSetup.vlocity_cmt__SetupValue__c != 'True')) {
            isLogging = true;
        }
    }

    /*
     * @description log at default DEBUG level
     */
    public static void write(String debugMessage) {
        if (isLogging)
            System.debug(LoggingLevel.DEBUG, debugMessage);
    }

    /*
     * @description log at Error level
     */
    public static void writeErr(String errMessage) {
        if (isLogging)
            System.debug(LoggingLevel.ERROR, errMessage);
    }

    /*
     * @description log at default INFO level
     */
    public static void writeInfo(String infoMessage) {
        if (isLogging)
            System.debug(LoggingLevel.INFO, infoMessage);
    }

    /*
     * @description log at Fine level
     */
    public static void writeFine(String fineMessage) {
        if (isLogging)
            System.debug(LoggingLevel.FINE, fineMessage);
    }

    /*
     * @description log with ERROR level
     */
    public static void write(Exception ex) {
        writeErr(ex.getLineNumber() + ': ' + ex.getMessage());
    }


    /*
     * @description log serialized variable at FINE level
     */
    public static void writeVar(String valName, Object val) {
        String strVal;
        if (val instanceof String) {
            strVal = (String)val;
        } else {
            strVal = JSON.serialize(val);
        }
        writeFine(valName + ': ' + strVal);
    }
}