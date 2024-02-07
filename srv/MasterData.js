const cds = require('@sap/cds');

function validateGstin() {
    if (this.Is_gstn_registered && !'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}[Z]{1}[0-9A-Z]{1}$'.test(this.GSTINNumber)) {
        return 'GSTIN is invalid';
    }
}

function validateSellPrice() {
    if (this.ProductSellPrice && this.ProductCostPrice && this.ProductSellPrice < this.ProductCostPrice)
     {
        return 'Sell price cannot be less than cost price';
    }
}

function validatePrice() {
    if (this.price && this.product_id.ProductCostPrice && this.price > this.product_id.ProductCostPrice) {
        return 'Price cannot be more than cost price';
    }
}

