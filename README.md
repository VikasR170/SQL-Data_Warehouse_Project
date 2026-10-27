
# 🚀 Building a Modern Data Warehouse with SQL Server

## 📖 Project Overview

This project demonstrates the development of a modern data warehouse using SQL Server. The solution consolidates data from multiple source systems, applies ETL processes to ensure data quality, and delivers a structured analytical model for reporting and business intelligence.

---

## 🎯 Project Objectives

- Build a modern data warehouse using SQL Server.
- Integrate data from ERP and CRM source systems.
- Clean and transform raw data using ETL processes.
- Create a user-friendly analytical data model.
- Enable data-driven decision-making through analytics and reporting.

---

## 🏗️ Data Architecture

The project follows the **Medallion Architecture** approach:

### 🥉 Bronze Layer
- Raw data ingestion from ERP and CRM CSV files.
- Data stored without transformation.

### 🥈 Silver Layer
- Data cleansing and standardization.
- Resolution of data quality issues.
- Data integration across source systems.

### 🥇 Gold Layer
- Business-ready dimensional model.
- Fact and dimension tables optimized for analytics and reporting.

---

## 📂 Data Sources

### ERP System
- Customer Data
- Product Data
- Sales Data

### CRM System
- Customer Information
- Product Information
- Sales Details

Data is provided as CSV files and loaded into SQL Server through ETL pipelines.

---

## ⚙️ ETL Process

### Extract
- Import data from ERP and CRM CSV files.

### Transform
- Handle missing values.
- Remove duplicates.
- Standardize formats.
- Validate business rules.
- Integrate datasets.

### Load
- Populate staging tables.
- Load transformed data into the data warehouse.

---

## 📊 Data Model

The warehouse uses a dimensional modeling approach consisting of:

| Type | Tables |
|------|--------|
| **Fact Tables** | `FactSales` |
| **Dimension Tables** | `DimCustomer`, `DimProduct`, `DimDate` |

This structure provides fast and efficient analytical querying.

---

## 📈 Analytics & Reporting

SQL-based analytics were developed to provide insights into:

### Customer Behavior
- Customer segmentation
- Purchasing patterns
- Top customers

### Product Performance
- Best-selling products
- Revenue by product
- Product category analysis

### Sales Trends
- Monthly sales performance
- Revenue growth analysis
- Seasonal trends

---

## 🛠️ Technologies Used

- SQL Server
- T-SQL
- ETL Processes
- Data Warehousing
- Dimensional Modeling
- Git & GitHub
- Draw.io (Architecture Diagrams)

---

## 📁 Project Structure

```
sql-data-warehouse-project/
│
├── datasets/
│   ├── source_erp/
│   └── source_crm/
│
├── scripts/
│   ├── bronze/
│   ├── silver/
│   └── gold/
│
├── docs/
│   ├── architecture.png
│   └── requirements.md
│
├── tests/
│
├── README.md
└── LICENSE
```

---

## ✅ Key Deliverables

- Data Warehouse built in SQL Server
- ETL Pipeline Implementation
- Data Quality Management
- Dimensional Data Model
- SQL Analytics Queries
- Business Insights Reporting
- Technical Documentation

---

## 📷 Architecture Diagram

![Architecture Diagram](docs/architecture.png)

---

## 👨‍💻 Author

**Vikas R**
Aspiring Data Analyst | SQL | Power BI | Python

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
