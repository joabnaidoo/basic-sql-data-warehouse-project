# Data Warehouse & Analytics Portfolio Project

## 📌 Project Overview

This repository contains a **hands-on implementation of an end-to-end data warehousing and analytics solution using SQL Server**.

The project follows a realistic data engineering workflow: source data is ingested from multiple systems, transformed through structured warehouse layers, integrated into an analytical data model, and ultimately prepared for business reporting and analysis.

The project was completed as a **guided learning and portfolio exercise based on an existing educational project by Data With Baraa**. The original project provided the datasets, business scenario, and overall implementation direction. I have worked through the implementation myself to develop practical familiarity with the technologies, patterns, and problem-solving approaches involved in building a data warehouse.

The purpose of including this project in my portfolio is therefore **not to present the original business case or solution as my own invention**, but to demonstrate that I have gained hands-on experience implementing common data warehousing processes and can work comfortably with the technologies and concepts involved.

---

## 🎯 Learning & Portfolio Objectives

The primary objective of this project was to gain practical experience with the complete lifecycle of a data warehousing solution.

Through the implementation, I worked with:

* Relational databases and SQL Server
* SQL-based data ingestion and transformation
* ETL/ELT concepts
* Medallion-style warehouse architecture
* Data cleansing and standardisation
* Data integration from multiple source systems
* Fact and dimension tables
* Star-schema data modelling
* Data quality validation
* Analytical SQL queries
* Business-oriented metrics and reporting
* Documentation of data structures and processes
* Version control using Git/GitHub

More importantly, the project gave me an opportunity to work through the types of technical problems that commonly occur when transforming operational data into a structure suitable for analytics.

---

# 🏗️ Data Warehouse Architecture

The warehouse is organised into three logical layers:

**Bronze → Silver → Gold**

![Data Architecture](docs/data_architecture.png)

### Bronze — Raw Data

The Bronze layer acts as the initial landing area for data originating from the source systems.

The objective at this stage is to preserve the source information as closely as possible while loading it into SQL Server.

Key activities include:

* Loading CSV source files
* Creating staging/raw tables
* Maintaining the original source structure where practical
* Establishing a consistent database structure for downstream processing

The source data represents information originating from separate **ERP and CRM systems**.

---

### Silver — Cleansed & Integrated Data

The Silver layer is responsible for turning the raw source data into reliable, consistent information suitable for modelling.

Typical transformation activities include:

* Identifying and resolving data quality issues
* Handling inconsistent values
* Standardising formats
* Cleaning dates and numerical fields
* Managing null and invalid values
* Applying business rules
* Integrating related information from the ERP and CRM sources
* Creating a consistent structure for downstream analytical modelling

This layer demonstrates an important data engineering principle: **analytical data should not simply be exposed directly from raw operational sources.**

---

### Gold — Business-Ready Data

The Gold layer contains the final analytical structures used for reporting and analysis.

The data is organised using a **star-schema approach**, separating measurable business events from descriptive entities.

The model includes:

* Fact tables
* Dimension tables
* Defined relationships
* Business-friendly attributes
* Analytical measures and metrics

This structure is intended to make analytical queries easier to write, understand, maintain, and optimise.

---

# 🔄 ETL / Data Transformation Process

The overall workflow can be summarised as:

```text
ERP CSV Files ──┐
                ├──> Bronze ──> Silver ──> Gold ──> Analytics
CRM CSV Files ──┘
```

The implementation required consideration of the full movement of data through the warehouse rather than treating the database simply as a collection of tables.

The process involved:

1. **Extract**
   Obtain data from the provided ERP and CRM CSV files.

2. **Load**
   Load the source information into the Bronze layer.

3. **Profile & Validate**
   Investigate the structure and quality of the incoming data.

4. **Transform**
   Clean, standardise, and integrate the data within the Silver layer.

5. **Model**
   Transform the integrated data into analytical fact and dimension structures.

6. **Validate**
   Perform checks to identify issues such as missing values, inconsistent records, invalid relationships, and unexpected results.

7. **Analyse**
   Use SQL queries against the Gold layer to generate business-oriented insights.

---

# 🧩 Business & Technical Problems Addressed

Although the business scenario and datasets originated from the source educational project, implementing the solution provided practical exposure to several problems commonly encountered in data projects.

### Multiple Source Systems

The data originates from separate ERP and CRM sources.

This introduces challenges around:

* Different data structures
* Different naming conventions
* Inconsistent formats
* Linking entities across systems
* Creating a unified analytical view of the business

### Data Quality

Raw operational data is not necessarily analysis-ready.

The transformation process therefore considers issues such as:

* Missing or incomplete values
* Invalid dates
* Inconsistent categorical values
* Incorrect or unexpected numerical values
* Duplicate or conflicting records
* Inconsistent identifiers

### Data Integration

Information from different source systems needs to be brought together while maintaining meaningful relationships between customers, products, sales, and other business entities.

### Analytical Data Modelling

Operational data structures are not always appropriate for analytical workloads.

The Gold layer therefore restructures the integrated data into a dimensional model designed around:

* Business processes
* Measures
* Dimensions
* Relationships
* Analytical query requirements

---

# 🗂️ Data Model

The final warehouse uses a **star schema** consisting of fact and dimension tables.

![Data Model](docs/data_models.png)

The dimensional model separates:

**Facts**

Business events containing measurable values such as sales-related quantities and amounts.

**Dimensions**

Descriptive entities used to provide analytical context, such as customers, products, and dates.

This approach allows questions such as:

* How are sales changing over time?
* Which products generate the most revenue?
* How do customers behave across different periods?
* Which customer segments contribute the most sales?
* How does product performance vary?

The model documentation can be found in the `docs/` directory.

---

# 📊 Analytics

Once the Gold layer has been created, SQL is used to explore the data and produce business-oriented analysis.

The analytical component focuses primarily on:

### Customer Analysis

Examining customer characteristics and purchasing behaviour.

### Product Analysis

Investigating product performance, sales contribution, and purchasing patterns.

### Sales Analysis

Analysing sales performance across different time periods and business dimensions.

The intention is to demonstrate the transition from:

**Raw Data → Reliable Data → Analytical Model → Business Insight**

rather than simply performing standalone SQL queries against raw source files.

---

# 🧪 Data Quality & Validation

Data quality checks form an important part of the implementation.

Examples of validation performed throughout the process include:

* Checking record counts between processing stages
* Identifying NULL or missing values
* Checking for duplicate records
* Validating primary-key uniqueness
* Checking relationships between fact and dimension records
* Identifying invalid or unexpected values
* Comparing transformed results against source data
* Validating analytical outputs for unexpected results

These checks help establish confidence that transformations have not unintentionally introduced data loss or incorrect results.

---

# 🛠️ Technologies & Tools

| Technology / Tool                       | Purpose                                                   |
| --------------------------------------- | --------------------------------------------------------- |
| **Microsoft SQL Server**                | Database and data warehouse platform                      |
| **SQL**                                 | Data extraction, transformation, validation, and analysis |
| **SQL Server Management Studio (SSMS)** | Database development and administration                   |
| **Git**                                 | Version control                                           |
| **GitHub**                              | Source-code management and portfolio hosting              |
| **Draw.io**                             | Architecture, data-flow, and data-model diagrams          |
| **CSV**                                 | Source data format                                        |
| **Markdown**                            | Project documentation                                     |

---

# 📁 Repository Structure

```text
data-warehouse-project/
│
├── datasets/
│   ├── source_erp/              # ERP source files
│   └── source_crm/              # CRM source files
│
├── docs/
│   ├── etl.drawio               # ETL process documentation
│   ├── data_architecture.drawio # Overall warehouse architecture
│   ├── data_flow.drawio         # Data movement through the warehouse
│   ├── data_models.drawio       # Dimensional/star schema
│   ├── data_catalog.md          # Dataset and field documentation
│   ├── naming-conventions.md    # Naming standards
│   └── requirements.md          # Project requirements
│
├── scripts/
│   ├── bronze/                  # Raw data ingestion
│   ├── silver/                  # Cleansing and transformation
│   └── gold/                    # Analytical modelling
│
├── tests/                       # Data quality and validation scripts
│
├── README.md                    # Project documentation
├── LICENSE                      # Project licence
└── .gitignore                   # Git exclusions
```

---

# 📚 Documentation

Additional technical documentation is available in the `docs/` directory.

This includes:

* Data architecture
* Data flow
* ETL approach
* Data modelling
* Data catalogue
* Naming conventions
* Project requirements

The diagrams are intended to document **how data moves through the solution and how the warehouse components relate to one another**, rather than simply presenting the final database structure.

---

# 💡 What I Took Away From This Project

This project was particularly valuable as a practical exercise because it required me to work through the implementation of a data warehouse rather than only studying the concepts theoretically.

The main areas of hands-on learning included:

* Designing layered data-processing workflows
* Working with SQL Server as a warehouse platform
* Writing SQL for data transformation and analysis
* Understanding the role of staging/raw data
* Identifying and addressing data-quality issues
* Integrating data from multiple source systems
* Designing dimensional models
* Building fact and dimension tables
* Applying validation checks throughout a data pipeline
* Structuring SQL projects for maintainability
* Documenting technical solutions for other users

The project also helped reinforce how individual technologies fit together as part of a broader **data engineering and analytics workflow**.

---

# ⚠️ Project Attribution & Scope

This repository is a **learning and portfolio implementation based on the SQL Data Warehouse project created by Baraa Khatib Salkini / Data With Baraa**.

The original educational project provided the underlying business scenario, datasets, project requirements, architecture direction, and learning material. Credit for the original project concept and instructional content belongs to the original creator.

I have worked through the implementation as a hands-on learning exercise and am presenting this repository to demonstrate my familiarity with the **concepts, technologies, development processes, and problem-solving techniques involved in building a data warehouse**.

The purpose of this repository is **not to claim ownership of the original project concept, datasets, or instructional solution**.

Original educational resource:

**Data With Baraa — SQL Data Warehouse Project**

[Original project resources](https://www.datawithbaraa.com/)

---

# 👤 About This Portfolio Project

This project forms part of my broader technical portfolio and is intended to demonstrate practical exposure to data engineering, data warehousing, SQL development, data modelling, and analytics.

Rather than presenting myself as having independently designed every aspect of this particular business case, I want this project to demonstrate something more specific:

> **I have hands-on experience implementing a complete data warehousing workflow and can work with the technologies and concepts involved in transforming raw source data into reliable, analytics-ready information.**

The skills demonstrated here are transferable to real-world data environments where requirements may involve integrating multiple sources, resolving data-quality problems, transforming data, designing analytical models, and making the resulting information accessible for reporting and decision-making.

---

## 📬 Contact

For more information about my professional experience or other projects in my portfolio, please visit my GitHub and LinkedIn profiles.

* **GitHub:** [Your GitHub Profile]
* **LinkedIn:** [Your LinkedIn Profile]
