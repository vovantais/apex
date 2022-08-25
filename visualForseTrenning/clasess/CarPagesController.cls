public with sharing class CarPagesController {

    private static final String ERROR_MESSAGE_PRODUCTS = 'Some error ';
    private static final String PRODUCT_FAMILY_NAME = 'auto';
    private static final String EMAIL_SUBJECT = 'Car Order!';
    private static final String EMAIL_BODY = ', your order success, our manager call you soon!';
    private Integer offsetSize = 0;
    private Integer queryLimit = 4;
    private Integer countTotalRecords;

    private List<Product2> allProducts;
    public List<Product2> products { get; set; }
    public List<SelectOption> carList { get; set; }
    public String customerName { get; set; }
    public String customerPhone { get; set; }
    public String customerEmail { get; set; }
    public String selectedCar { get; set; }
    public String selectedFields { get; set; }
    public Boolean isSuccessSend { get; set; }
    public Integer priceCar { get; set; }

    public CarPagesController() {
        allProducts = CarPagesManager.getProductsByProductFamilyName(PRODUCT_FAMILY_NAME, 0, 50000);
        countTotalRecords = allProducts.size();
        getProducts();
        this.carList = getCarList();
        this.isSuccessSend = false;
    }

    public void getProducts() {
        products = CarPagesManager.getProductsByProductFamilyName(PRODUCT_FAMILY_NAME, offsetSize, queryLimit);
        isSuccessSend = false;
    }

    public PageReference next() {
        offsetSize += queryLimit;
        getProducts();
        this.carList = getCarList();
        return null;
    }

    public PageReference previous() {
        offsetSize -= queryLimit;
        getProducts();
        this.carList = getCarList();
        return null;
    }

    public Boolean getDisablePrevious() {
        if (offsetSize > 0) {
            return false;
        }
        return true;
    }

    public Boolean getDisableNext() {
        if (offsetSize + queryLimit < countTotalRecords) {
            return false;
        }
        return true;
    }

    public List<SelectOption> getCarList() {
        List<SelectOption> options = new List<SelectOption>();
        for (Product2 product : products) {
            options.add(new SelectOption(product.Name, product.Name));
        }

        return options;
    }


    public void passSelectedCarToController() {
        selectedCar = selectedFields;
    }

    public PageReference filterCarByPrice() {
        getProducts();
        List<Product2> filteredProduct = new List<Product2>();
        for (Product2 product : products) {
            if (priceCar <= product.Price__c) {
                filteredProduct.add(product);
            }
        }
        products = filteredProduct;
        return null;
    }

    public PageReference saveData() {
        new ApexEmailServise().sendMail(customerEmail, EMAIL_SUBJECT, 'Hi ' + customerName + EMAIL_BODY);
        List<Case> cases = new List<Case>();
        for (Product2 product : allProducts) {
            if (product.Name == selectedCar) {
                cases.add(new Case(
                        Status = 'New',
                        Origin = 'Web',
                        Type = 'Electrical',
                        Subject = 'new Car',
                        SuppliedPhone = customerPhone,
                        Description = customerName +' '+ customerEmail,
                        Equipment__c = product.Id
                ));
            }
        }
        try {
            insert cases;
        } catch (Exception err) {
            throw new GlobalException(ERROR_MESSAGE_PRODUCTS + err.getMessage() + ' ' + err.getStackTraceString());
        }
        isSuccessSend = true;
        resetFormValues();
        return null;
    }


    public void resetFormValues() {
        customerName = '';
        customerPhone = '';
        customerEmail = '';
        selectedCar = '';
    }
}