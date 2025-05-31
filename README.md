# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse** repository! 🚀  
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights.

## 🏗️ Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:


1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.


![De1 drawio](https://github.com/user-attachments/assets/31ccd9a6-0f2b-4957-ae6d-32581d998d8f)


---
## 📖 Project Overview

This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries in the Gold layer.
<!-- 4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights. -->

---

## 🛠️ Important Tools used:

- **[Datasets](datasets/):** Access to the project dataset (csv files).
- **[SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads):** Lightweight server for hosting your SQL database.
- **[SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16):** GUI for managing and interacting with databases.
- **[Git Repository](https://github.com/):** Set up a GitHub account and repository to manage, version, and collaborate on your code efficiently.
- **[DrawIO](https://www.drawio.com/):** Design data architecture, models, flows, and diagrams.
- **[Notion](https://www.notion.com/templates/sql-data-warehouse-project):** Plan the steps to take relevant actions 


---

## 🚀 Project Requirements

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.
- **Business Use Cases**:
  - Customer segmentation and behavior analysis
  - Product performance tracking
  - Sales trends
---

## ⚙️ How to Run This Project

1. **Clone the Repository**

   ```bash
   git clone https://github.com/mohana-123/DWH_Project
   cd DWH_Project
2. **Set Up SQL Server Environment**
* Install SQL Server Express and Azure Data Studio (if not already installed).
  
3. **Run ETL Scripts**
* Run `scripts/database_init.sql` to initialize the database and schemas.
* Load ERP and CRM CSV files into Bronze layer tables using scripts in `scripts/bronze/`.
* Transform and clean the data using scripts in `scripts/silver/`.
* Execute the script in `scripts/gold/` to generate business-ready data for analytics and reporting.
  
![dataflow drawio](https://github.com/user-attachments/assets/1a5da659-fa91-489e-a5fa-63614bed33e6)


4. **Explore Data**
* Use the star schema in the Gold layer for analytical queries and reporting.
  
![Data Mart of star schema drawio](https://github.com/user-attachments/assets/c0da4655-fdb2-41c3-a22d-20dfd510c93c)

## 🧪 Testing & Validation
* Data quality checks scripts in the tests/ folder ensure:
  * Data consistency, accuracy, and standardization by checking for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.
  * Uniqueness of surrogate keys in dimension tables.
  * Referential integrity between fact and dimension tables.
  * Validation of relationships in the data model for analytical purposes.
---


## 🔮 Future Work
This project lays the foundation for a robust and scalable data warehouse. Future enhancements could include:

* 📊 SQL-Based Analytics
  
  Develop advanced SQL queries to extract business insights such as:
  * Customer segmentation
  * Sales trends
  * Product performance
  * Revenue by country
    
* 📈 Integration with BI Tools
  
  Connect the Gold layer to Business Intelligence tools like:
  * Power BI
  * Tableau
  * Metabase
    
  ...to create interactive dashboards and self-service analytics for stakeholders.

* 🛠️ Automation & Scheduling

  Use SQL Server Agent or external orchestration tools (e.g., Airflow, Azure Data Factory) to automate ETL pipelines and data refreshes.

* 🔐 Role-Based Access Control (RBAC)

  Enforce security policies and access levels depending on user roles (data analyst, data engineer, etc.)

* 📦 Data Export APIs

  Build export mechanisms for downstream systems and data consumers.
<!--
### BI: Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.  
-->
