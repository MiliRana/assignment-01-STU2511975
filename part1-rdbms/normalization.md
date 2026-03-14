## Anomaly Analysis

### Insert Anomaly
In the current flat table, product information can only be inserted when an order exists. This means a new product cannot be stored in the system unless it is part of an order.

Example from the dataset:
Columns involved: product_id, product_name, category, unit_price, order_id

For example, product **P004 (Notebook)** appears in multiple rows such as:
- Row 1 → order_id = ORD1027
- Row 11 → order_id = ORD1162
- Row 14 → order_id = ORD1133

If the company wants to add a new product that has not yet been ordered, there is no place to store it because every product entry requires an order_id.

---

### Update Anomaly
If the price or details of a product change, the update must be applied to every row where that product appears. Missing even one row would create inconsistent data.

Example from the dataset:
Columns involved: product_id, product_name, unit_price

Product **P004 (Notebook)** with unit_price = 120 appears in multiple rows:
- Row 1 → ORD1027
- Row 11 → ORD1162
- Row 14 → ORD1133
- Row 34 → ORD1021

If the price of the Notebook changes from 120 to 130, every row containing product_id P004 must be updated. If one row is missed, the database will contain conflicting prices.

---

### Delete Anomaly
If an order row is deleted, important information about the product or customer may also be lost.

Example from the dataset:
Columns involved: order_id, product_id, product_name, category

If the last order containing a product is deleted (for example the only row containing a particular product_id), then the database will also lose all information about:
- the product name
- category
- unit price

This means deleting an order can accidentally remove important product data from the system.
