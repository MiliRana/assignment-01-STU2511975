## ETL Decisions

### Decision 1 — Standardizing Date Formats
Problem:  
The raw dataset contained inconsistent date formats such as "01/02/2024", "2024-01-02", and "2-Jan-2024". These different formats could cause issues when performing time-based analysis in the data warehouse, especially for monthly or yearly reporting.

Resolution:  
To resolve this issue, all dates were converted into a single standardized format (YYYY-MM-DD) before loading them into the `dim_date` table. This ensured that the data warehouse could consistently interpret and group dates when generating reports such as monthly sales trends or year-over-year comparisons.

### Decision 2 — Handling NULL or Missing Values
Problem:  
Some rows in the raw data contained NULL or missing values in important fields such as product category or quantity. Leaving these values unchanged could lead to incorrect aggregations or incomplete records in the warehouse.

Resolution:  
During the transformation step, missing values were handled by either replacing them with appropriate default values or excluding incomplete records where necessary. For example, records with missing sales quantities were removed, while missing categorical values were replaced with standardized labels where possible.

### Decision 3 — Standardizing Product Category Casing
Problem:  
The dataset contained inconsistent casing for product categories such as "electronics", "Electronics", and "ELECTRONICS". This would cause the warehouse to treat them as separate categories when performing grouped analysis.

Resolution:  
All category values were standardized to a consistent format using title case (e.g., Electronics, Clothing, Groceries). This ensured that categories were grouped correctly in analytical queries and prevented duplicate category labels from appearing in reports.
