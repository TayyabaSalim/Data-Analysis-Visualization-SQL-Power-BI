# 📊 Fuzzy Factory Ecommerce Analytics — SQL & Power BI Portfolio

A comprehensive data analytics project analyzing multi-year transactional ecommerce data to evaluate sales performance, marketing campaign efficacy, website conversion funnels, and product profitability. Built using SQL for data extraction, cleaning, and transformation, and Power BI for interactive executive dashboards.

---

## 🛠️ Project Architecture & Data Model

The data model connects relational datasets spanning product catalogs, order items, refunds, website sessions, and granular pageviews.

### Data Model Architecture
![Power BI Model View](images/model_view.PNG)

---

## 📊 Power BI Dashboard Highlights

### 1. Executive Business Analysis
Evaluates overall revenue trends, gross margins, monthly growth patterns, and order velocity.
![Business Analysis Dashboard](images/Business_Analysis.jpg)

### 2. Website & Conversion Funnel Analysis
Tracks website traffic across device types, top landing pages, bounce rates, and session-to-order conversion metrics.
![Website Analysis Dashboard](images/Website_Analysis.jpg)

### 3. Product Performance & Refund Analytics
Measures revenue contribution, gross profit margins, unit sales volume, and refund rates per product.
![Product Analysis Dashboard](images/Product_Analysis.jpg)

---

## 📁 Repository Structure

```text
├── sql/
│   ├── 01_create_database.sql    # Schema setup & CSV ingestion
│   ├── 02_data_cleaning.sql     # Duplicate checks, NULL audits, & data integrity
│   ├── 03_business_queries.sql   # Core business KPIs & revenue calculations
│   ├── 05_website_analysis.sql  # Funnel, session, & device conversion queries
│   └── 06_product_analysis.sql  # Product ranking, sales, & refund rate analysis
├── images/
│   ├── model_view.PNG
│   ├── Business_Analysis.jpg
│   ├── Website_Analysis.jpg
│   └── Product_Analysis.jpg
└── README.md
