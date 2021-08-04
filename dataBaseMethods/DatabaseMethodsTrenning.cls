public with sharing class DatabaseMethodsTrenning {

	private final String oppId; 
	
	public static void insertNewOpportunity() {
		
	List<Opportunity> opportunities = new List<Opportunity>{
		new Opportunity(
		Name = 'test', 
		StageName = 'test2',
		CloseDate = Date.today()    
		);
	};

	Database.SaveResult[] opportunitiesList = Database.insert(opportunities, false);

	dataBaseCheckResult(opportunitiesList);
	}
	
	public static void updateOpportunityById() {
		if (getOpportunityById(oppId) != null) {
			for (Opportunity opp :opportunities) {
				opp.StageName = 'hello world';
			}

			Database.SaveResult[] updateOpportunities = Database.update(opportunities, false);

			dataBaseCheckResult(updateOpportunities);
		}
	}

	public static void deleteOpportunityById() {
		if (getOpportunityById(oppId) != null) {
			Database.DeleteResult[] deleteOpportunities = Database.delete(opportunities, false);
			
			dataBaseCheckResult(deleteOpportunities);
		}
	}

	public static List<Opportunity> getOpportunityById(Id oppId) {
		if (oppId != null) {
			return [
				SELECT 
				Id, 
				Name, 
				StageName, 
				CloseDate 
				FROM Opportunity 
				WHERE Id =: oppId
			];
		} 
		return null;
	}

	public static void dataBaseCheckResult(List opportunitiesList) {
		for (Database.SaveResult opp : opportunitiesList) {
			if (opp.isSuccess()) {
				System.debug('Successfully inserted Opportunity. Opportunity ID: ' + opp.getId());
				oppId = opp.getId();
			} else {        
				for (Database.Error err : sr.getErrors()) {              
					System.debug('The Error has occurred. ' + err.getStatusCode() + ': ' + err.getMessage());
				}
			}
		}
	}
}
