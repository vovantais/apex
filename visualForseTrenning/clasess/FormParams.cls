public with sharing class FormParams {

    public String Name { get; set; }
    public String Phone { get; set; }
    public String Rating { get; set; }

    public FormParams() {
        this.Name = '';
        this.Phone = '';
        this.Rating = '';
    }
}