

public with sharing class OppsController {


    public ApexPages.StandardSetController setOpp {
        get {
            if(setOpp == null) {
                setOpp = new ApexPages.StandardSetController(Database.getQueryLocator(
                        [SELECT Name, Type, Amount, CloseDate FROM Opportunity]));
            }
            return setOpp;
        }
        set;
    }

    public List<Opportunity> getOpportunities() {
        return (List<Opportunity>) setOpp.getRecords();
    }

    public List<OppFields> getPieData() {
        List<OppFields> data = new List<OppFields>();
        for (Opportunity opp : getOpportunities()) {
            if (opp.Amount != null)  {
                Integer amount = (Integer) opp.Amount;
                data.add(new OppFields(opp.Name, amount));
            }
        }
        return data;
    }

    public class OppFields {

        public String name { get; set; }
        public Integer amount { get; set; }

        public OppFields(String name, Integer amount) {
            this.name = name;
            this.amount = amount;
        }
    }
}