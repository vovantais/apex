public with sharing class CarPagesManager {

    public static List<Product2> getProductsByProductFamilyName(
            String productFamilyName,
            Integer offsetSize,
            Integer queryLimit
    ) {
        if (productFamilyName == null) return null;
        return [
                SELECT
                        Id,
                        Name,
                        IsActive,
                        Model__c,
                        Price__c,
                        Year__c,
                        Cost__c,
                        Description__c,
                        urlAttach__c
                FROM
                        Product2
                WHERE IsActive = TRUE
                AND Family = :productFamilyName
                LIMIT :queryLimit
                OFFSET :offsetSize
        ];
    }
}