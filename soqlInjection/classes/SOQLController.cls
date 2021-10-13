public class SOQLController {
    
    public static final String ERROR_EXCEPTION = 'Error DML!';
    
    
    public String testData {
        get { return testData;}
        set { testData = value;} 
    }
      
   public List<Contact> cont { get; set; }
    
   public PageReference query() { 
       String qryString  = 'SELECT Id, Title, ' + String.escapeSingleQuotes(testData) +  ' FROM Contact'; 
       try {
           cont = (List<Contact>) Database.query(qryString);
       } catch (Exception err) {
           throw new GlobalException(ERROR_EXCEPTION);
       }
       
       return null; 
    } 
}