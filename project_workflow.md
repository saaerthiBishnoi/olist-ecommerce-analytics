# Project Workflow — Olist E-Commerce Analytics

This document explains the complete end-to-end workflow followed in this project, from raw CSV ingestion to business intelligence reporting.

---

## 1. Dataset Collection

Source:
Olist Brazilian E-Commerce Dataset (Kaggle)

The project uses multiple CSV files:

- Orders
- Order Items
- Customers
- Products
- Sellers
- Payments
- Reviews
- Geolocation
- Category Translation

Purpose:
To simulate a real-world e-commerce transactional database.

---

## 2. PostgreSQL Database Setup

Created a PostgreSQL database:

```sql
CREATE DATABASE olist_db;
```

Purpose:
To store raw transactional data and build an optimized analytical layer.

---

## 3. Raw Table Creation

Created 9 normalized tables:

- olist_orders_dataset
- olist_order_items_dataset
- olist_customers_dataset
- olist_products_dataset
- olist_sellers_dataset
- olist_order_payments_dataset
- olist_order_reviews_dataset
- olist_geolocation_dataset
- product_category_name_translation

Purpose:
To preserve raw data structure.

---

## 4. Data Ingestion

Imported CSV files into PostgreSQL using COPY command.

Example:

```sql
COPY olist_orders_dataset
FROM '/path/olist_orders_dataset.csv'
DELIMITER ','
CSV HEADER;
```

Purpose:
Efficient bulk loading of large datasets.

---

## 5. Data Validation

Performed:

- Row count validation
- Null value checks
- Duplicate checks
- Key uniqueness verification

Purpose:
Ensure data consistency and integrity.

---

## 6. Foreign Key Relationships

Built relational integrity:

Orders → Customers  
Order Items → Orders  
Order Items → Products  
Order Items → Sellers  
Payments → Orders  
Reviews → Orders

Purpose:
To establish normalized data relationships.

---

## 7. Query Optimization

Created indexes on:

- order_id
- customer_id
- product_id
- seller_id
- purchase_timestamp

Purpose:
Improve JOIN and filter performance.

Impact:
Faster BI queries.

---

## 8. BI Views Creation

Built analytical SQL views:

### bi_dim_product
Product-level dimension.

Includes:
- category
- dimensions
- volume

---

### bi_fact_review_latest
Latest review per order.

Purpose:
Remove duplicate review entries.

---

### bi_fact_order
Order-level business logic.

Includes:
- delivery_days
- late_flag
- purchase_date

---

### bi_fact_sales (Main Fact Table)

Master denormalized analytical table.

Combines:

- Orders
- Products
- Customers
- Sellers
- Payments
- Reviews

Purpose:
Main source for Power BI.

---

## 9. Power BI Connection

Connected PostgreSQL to Power BI using:

DirectQuery Mode

Purpose:
Maintain live connection with database.

Benefit:
Dashboard updates dynamically.

---

## 10. Data Modeling

Loaded:

- bi_fact_sales
- optional dimension tables

Created:

DimDate table

Built relationships:

DimDate[Date] → purchase_date

Purpose:
Enable time intelligence calculations.

---

## 11. DAX Measures Creation

Created 20+ DAX measures:

### Base KPIs
- Revenue
- Orders
- Customers
- AOV
- GMV

### Logistics KPIs
- Delivered Orders
- Late Orders
- On-time %

### Time Intelligence
- Revenue YTD
- Revenue LY
- YoY %
- Rolling 30D Revenue

### Review Metrics
- Avg Rating
- Positive Reviews %
- Negative Reviews %

### Payment Metrics
- Payment Value
- Avg Installments
- Avg Payment per Order

Purpose:
Business metric calculation layer.

---

## 12. Dashboard Development

Built 8 business-focused dashboard pages:

### Page 1 — Executive Overview
High-level KPI summary.

---

### Page 2 — Sales Analysis
Revenue trends and category contribution.

---

### Page 3 — Product Analysis
Category and product performance.

---

### Page 4 — Customer Analysis
Customer growth and repeat behavior.

---

### Page 5 — Logistics Analysis
Delivery speed and late shipment analysis.

---

### Page 6 — Review Analysis
Customer sentiment and rating behavior.

---

### Page 7 — Payment Analysis
Payment methods and installment behavior.

---

### Page 8 — Insights Summary
Business insights extracted from all pages.

---

## 13. Business Insight Generation

Generated strategic insights across:

- Revenue growth
- Customer retention
- Logistics efficiency
- Product performance
- Review sentiment
- Payment behavior

Purpose:
Convert data into actionable business decisions.

---

## Final Architecture

```text
CSV Files
   ↓
PostgreSQL Raw Tables
   ↓
Indexes
   ↓
BI Views
   ↓
Power BI DirectQuery
   ↓
Data Modeling
   ↓
DAX Measures
   ↓
Interactive Dashboards
   ↓
Business Insights
```

---

## Project Outcome

This project demonstrates:

- SQL data engineering
- Data modeling
- Query optimization
- Business intelligence reporting
- KPI development
- Data storytelling
- Business analysis

Tech Stack:

- PostgreSQL
- SQL
- Power BI
- DAX
- DirectQuery
- Data Modeling
