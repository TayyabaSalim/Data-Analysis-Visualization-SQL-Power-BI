# Fuzzy Factory Ecommerce Analytics — SQL & Power BI

A SQL and Power BI analytics project focused on ecommerce performance, website activity, product sales, and refund behavior using multi-year transactional data.

## Overview

The project uses SQL to prepare and analyze relational ecommerce data and Power BI to present the results through interactive dashboards.

The analysis covers:

* Sales and revenue performance
* Gross profit and margins
* Website sessions and conversion
* Product-level performance
* Refund activity
* Device and landing-page analysis

## Data Model

The database contains related datasets covering:

* Products
* Orders
* Order items
* Refunds
* Website sessions
* Website pageviews

SQL was used to create the database structure, perform data checks, clean the data, and calculate business metrics.

## SQL Analysis

The SQL work includes:

* Database and table creation
* Data cleaning and integrity checks
* NULL and duplicate analysis
* Revenue and sales calculations
* Website conversion analysis
* Product performance analysis
* Refund rate calculations
* Business KPI queries

## Power BI Dashboards

### Executive Business Analysis

Examines revenue trends, gross margin, monthly performance, and order activity.

### Website & Conversion Analysis

Analyzes website traffic, landing pages, device usage, bounce rates, and session-to-order conversion.

### Product & Refund Analysis

Compares products based on revenue, units sold, gross profit, margins, and refund rates.

## Project Structure

```text
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_business_queries.sql
│   ├── 05_website_analysis.sql
│   └── 06_product_analysis.sql
├── images/
│   ├── model_view.PNG
│   ├── Business_Analysis.jpg
│   ├── Website_Analysis.jpg
│   └── Product_Analysis.jpg
└── README.md
```

## Tools

* **SQL**
* **Power BI**
* Relational data modeling
* Data cleaning and transformation
* Business KPI analysis
* Dashboard development

## Objective

The project demonstrates the use of SQL for structured data analysis and Power BI for communicating business findings through interactive visualizations.
