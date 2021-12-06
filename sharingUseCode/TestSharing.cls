public class TestSharing {
	
   public static Boolean manualShareRead(Id recordId, Id userOrGroupId) {

      Boolean isShare;

      Questionnaire_result__Share jobShr  = new Questionnaire_result__Share();

      jobShr.ParentId = recordId;
      jobShr.UserOrGroupId = userOrGroupId;  
      jobShr.AccessLevel = 'Read';
      jobShr.RowCause = Schema.Questionnaire_result__Share.RowCause.testSharing__c;

      try {
            Database.SaveResult result = Database.insert(jobShr, false);
               if (result.isSuccess()) {
                  isShare = true;
               }
      } catch (Exception err) {
            System.debug('Some error! ' + err.getMessage() + ' ' + err.getStackTraceString());
            isShare = false;
      }
      return isShare;
   }
}