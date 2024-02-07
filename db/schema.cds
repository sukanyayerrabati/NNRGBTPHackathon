namespace com.satinfotech.hackathon;

// Define BusinessPartner entity
entity BusinessPartner {
    key BusinessPartnerNumber : UUID;
    Name : String;
    Address1 : String;
    Address2 : String;
    City : String;
    State : String @cds.persistence.skip;
    PINCode : String @cds.validate.pattern: '^[0-9]{6}$'; // PINCode validation
    Is_gstn_registered : Boolean;
    GSTINNumber : String @cds.validate.pattern: '/^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}[Z]{1}[0-9A-Z]{1}$/';
    IsVendor : Boolean;
    IsCustomer : Boolean;
}

// Define Store entity
entity Store {
    key StoreID : UUID;
    Name : String;
    Address1 : String;
    Address2 : String;
    City : String;
    State : String @cds.persistence.skip;
    PINCode : String @cds.validate.pattern: '^[0-9]{6}$'; // PINCode validation using CDS annotation
}

// Define Product entity
entity Product {
    key ProductID : UUID;
    ProductName : String;
    ProductImageURL : String @cds.validate.url; // Validate as a URL using CDS annotation
    ProductCostPrice : Decimal(15,2);
    ProductSellPrice : Decimal(15,2);
    
    }

// Define StockData entity
entity StockData {
    key StockID : UUID;
    store_id : Association to Store;
    product_id : Association to Product;
    stock_qty : Integer;
}

// Define PurchaseApp entity
entity PurchaseApp {
    key PurchaseOrderNumber : UUID;
    BusinessPartner : Association to BusinessPartner;
    PurchaseOrderDate : DateTime;
    Items : Composition of many{
        key product_id: UUID;
        qty :Association to Items;
        price:
    }
}



// Define SalesApp entity
entity SalesApp{
    key SalesOrderNumber : UUID;
    BusinessPartner : Association to BusinessPartner;
    SalesDate : DateTime;
    Items : Composition of many Items on Items.parent;
}
    store_id : Association to Store;
}
