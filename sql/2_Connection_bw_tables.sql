-- Copy data from local system to SQL
COPY olist_customers_dataset FROM 'D:\Downloads\PostgreSQL and Power BI My work\DataSet\olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_geolocation_dataset FROM 'D:\Downloads\PostgreSQL and Power BI My work\DataSet\olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_products_dataset FROM 'D:\Downloads\PostgreSQL and Power BI My work\DataSet\olist_products_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_sellers_dataset FROM 'D:\Downloads\PostgreSQL and Power BI My work\DataSet\olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_orders_dataset FROM 'D:\Downloads\PostgreSQL and Power BI My work\DataSet\olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_order_items_dataset FROM 'D:\Downloads\PostgreSQL and Power BI My work\DataSet\olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_order_payments_dataset FROM 'D:\Downloads\PostgreSQL and Power BI My work\DataSet\olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_order_reviews_dataset FROM 'D:\Downloads\PostgreSQL and Power BI My work\DataSet\olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;

COPY product_category_name_translation FROM 'D:\Downloads\PostgreSQL and Power BI My work\DataSet\product_category_name_translation.csv' DELIMITER ',' CSV HEADER;

Select * FROM olist_geolocation_dataset;
select * from olist_customers_dataset
