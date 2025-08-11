Zepto Grocery Data Analysis — SQL Solution
•	Problem Statement
As quick-commerce platforms like Zepto scale operations, managing extensive product catalogs, maintaining inventory levels, and optimizing discount strategies present significant challenges. Without a centralized database and robust analytical framework, uncovering sales trends, identifying stock-out risks, and evaluating promotional effectiveness is laborious and prone to error. This project delivers a comprehensive SQL-based solution to streamline grocery retail analytics and enable data-driven decision-making.

•	Project Overview
Developed an end-to-end data pipeline—from relational schema design to advanced SQL analytics—leveraging real-world grocery sales data. The initiative demonstrates proficiency in database engineering, complex query formulation, and actionable business intelligence.

•	Objectives
1.	Design and implement a normalized PostgreSQL schema for grocery sales and inventory

2.	Execute analytical SQL queries to reveal trends in sales, discounts, and stock levels

3.	Evaluate promotional performance by correlating discount rates with SKU-level sales

4.	Detect and quantify stock-out occurrences to inform inventory management

5.	Provide reusable SQL scripts for ongoing reporting and ad-hoc analysis

6.	Generate insightful recommendations for pricing and inventory optimization

•	Key Metrics & Features
1.	Average Discount Rate: 14.5% across all SKUs

2.	Stock-Out Incidence: 8% of products unavailable in the most recent month

3.	Category Leader: Beverages achieved the highest average quantity sold per SKU

4.	Promotion Analysis: 12 SKUs identified with deep discounts (>50%) yet low sales

5.	Performance Dashboards: Parameterized SQL scripts for custom reporting

•	Tools & Technologies
1.	PostgreSQL: Database engine for schema management and query execution

2.	pgAdmin 4: SQL development and administration interface

3.	SQL (DDL & DML): Schema creation, data ingestion, complex joins, window functions, aggregations

4.	Excel: Data validation, exploratory analysis, and result verification

•	Repository Contents
1.	zepto_schema.sql: Defines tables, relationships, indexes, and constraints

2.	sample_data.sql: Inserts representative data for demonstration purposes

3.	zepto_analysis.sql: Encapsulates all analytical queries and KPI calculations

4.	README.md: Project documentation and execution guidelines

•	Schema Design Highlights
1.	products: SKU metadata, category, pricing

2.	sales: Transaction records with quantity, discount, and timestamp

3.	inventory: Stock levels, replenishment dates, status flags

4.	categories: Master list of product categories and attributes

5.	Enforced referential integrity with foreign keys; optimized query performance via indexing

•	Business Insights
1.	An average discount of 14.5% suggests an aggressive pricing posture.

2.	A stock-out rate of 8% highlights opportunities to refine inventory replenishment policies.

3.	The Beverages category outperformed others in unit sales, signaling potential for cross-category promotional strategies.

4.	Identified 12 underperforming SKUs with steep discounts, indicating misaligned promotional investments.

5.	Seasonal sales patterns and category-specific trends inform demand forecasting models.

•	Recommendations
1.	Inventory Management: Implement automated alerts for SKUs approaching stock-out thresholds to sustain availability.

2.	Promotional Strategy: Reassess and rationalize discount tiers for low-performing SKUs to prevent margin erosion.

3.	Category Expansion: Leverage successful beverage sales tactics—bundling, dynamic pricing—for adjacent categories.

4.	Data-Driven Refinement: Continuously monitor KPI trends via scheduled SQL reports for proactive decision-making
