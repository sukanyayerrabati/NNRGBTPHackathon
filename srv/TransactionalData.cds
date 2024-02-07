using {com.satinfotech.hackathon as db} from '../db/schema';

service TransactionalData {
    entity StockData as projection on db.StockData{
        @UI.Hidden : true
        store_id,
        *
    };
    entity PurchaseApp as projection on db.PurchaseApp{
        @UI.Hidden : true
        PurchaseOrderNumber,
        *
    };
    entity SalesApp as projection on db.SalesApp{
        @UI.Hidden : true
        SalesOrderNumber,
        *
    };
}