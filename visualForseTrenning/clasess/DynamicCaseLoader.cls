public class DynamicCaseLoader {
    public Case caseDetails { get; private set; }

    public DynamicCaseLoader(ApexPages.StandardController controller) {
        String caseId = [SELECT Id FROM Case WHERE Id = '5005g00000MJDlp'].Id;
        String theQuery = 'SELECT Id, ' + joinList(caseFieldList, ', ') + ' FROM Case WHERE Id = :caseId';
        this.caseDetails = Database.query(theQuery);
    }

    public List<String> caseFieldList {
        get {
            if (caseFieldList == null) {
                caseFieldList = new List<String>();
                caseFieldList.add('CaseNumber');
                caseFieldList.add('Origin');
                caseFieldList.add('Status');
                caseFieldList.add('Contact.Name');
                caseFieldList.add('Account.Name');
            }
            return caseFieldList;
        }
        private set;
    }

    private static String joinList(List<String> theList, String separator) {
        if (theList == null && separator == null) return null;

        String joined = '';
        Boolean firstItem = true;
        for (String item : theList) {
            if (null != item) {
                if (firstItem) {
                    firstItem = false;
                } else {
                    joined += separator;
                }
                joined += item;
            }
        }
        return joined;
    }
}