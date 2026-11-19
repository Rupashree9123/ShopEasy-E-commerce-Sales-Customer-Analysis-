# ShopEasy-E-commerce-Sales-Customer-Analysis-
Python, SQL, Power BI, Excel

##  Project Overview

ShopEasy is an end-to-end data analytics project designed to analyze e-commerce sales performance, customer purchasing behavior, product performance, and order outcomes.

The project uses Python for data cleaning, SQL Server for data analysis, and Power BI for interactive visualization. The goal is to transform raw transactional data into meaningful business insights and recommendations that can support better decision-making.

##  Business Objectives

- Analyze overall revenue and order performance.
- Identify the highest-revenue product categories and products.
- Understand customer value and purchase frequency.
- Evaluate monthly sales and order trends.
- Analyze product returns and order cancellations.
- Compare sales performance across cities and states.
- Build an interactive dashboard to monitor key performance indicators (KPIs).

##  Dataset Description

The project uses three datasets:

| Dataset | Records | Description |
|---|---:|---|
| Orders | 100,000 | Order IDs, customers, products, dates, quantities, discounts, and statuses |
| Customers | 20,000 | Customer details, demographics, cities, states, and signup dates |
| Products | 500 | Product IDs, names, categories, and prices |

After data cleaning and validation, **99,995 valid orders** were retained for analysis.

##  Tools & Technologies

- **Python:** Data processing and cleaning
- **Pandas:** Data manipulation and validation
- **SQL Server:** Querying and business analysis
- **Power BI:** Dashboard creation and visualization
- **DAX:** KPI calculations and analytical measures
- **Excel:** Supporting data review

##  Data Cleaning Using Python

Python and Pandas were used to prepare the raw order data for analysis.

Key cleaning activities:
- Checked for missing values and duplicate order IDs.
- Validated customer IDs and product IDs against reference datasets.
- Identified invalid quantities and discount values.
- Converted order dates into a consistent date format.
- Handled invalid date records.
- Standardized inconsistent order status values.
- Removed invalid records and exported the cleaned dataset as `clean_orders.csv`.

**Cleaning result:** 100,000 raw orders → 99,995 cleaned orders.

##  SQL Analysis

SQL Server was used to answer business questions and calculate key metrics.

### Analysis performed
- Total orders by status
- Monthly order volume and revenue
- Total revenue by product category
- Average Order Value (AOV) by category
- Top 10 customers by revenue
- Customers with the highest order frequency
- Top 10 products by revenue
- Most frequently ordered products
- Return and cancellation rates by category
- Revenue by city and state
- Average discount overall and by category
- Revenue and order performance comparisons

### SQL concepts used
`SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, `JOIN`, aggregate functions, subqueries, conditional calculations, date functions, and percentage calculations.

### Sample SQL Query

```sql
SELECT
    p.Category,
    SUM(o.Quantity * p.Price * (1 - o.Discount)) AS TotalRevenue
FROM clean_orders AS o
JOIN Products AS p
    ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalRevenue DESC;
```

##  Key Performance Indicators (KPIs)

| KPI | Result |
|---|---:|
| Total Revenue | ₹1.80 billion |
| Valid Orders Analyzed | 99,995 |
| Average Order Value | ₹18,047.51 |
| Delivered Orders | 88.00% |
| Returned Orders | 7.90% |
| Cancelled Orders | 4.10% |
| Average Discount | 11.50% |

Revenue was calculated as:

**Revenue = Quantity × Product Price × (1 − Discount)**

Average Order Value was calculated as total revenue divided by the number of order records.

## 💡 Key Business Insights

### 1. Revenue Performance
- ShopEasy generated approximately **₹1.80 billion** in revenue.
- Electronics was the leading category, contributing approximately **₹1.03 billion**.
- Home ranked second, generating approximately **₹308.61 million**.

### 2. Monthly Trends
- July recorded the highest monthly revenue at approximately **₹155.91 million**.
- February recorded the lowest monthly revenue at approximately **₹142.28 million**.
- Monthly revenue remained relatively stable throughout the year.

### 3. Customer Analysis
- Customer C19073 generated approximately **₹0.93 million** from six orders.
- Customer C04335 placed the highest number of orders, with 18.
- Both order frequency and transaction value contributed to customer revenue.

### 4. Product Performance
- All top 10 revenue-generating products belonged to Electronics.
- The most frequently ordered products were spread across multiple categories.
- High order frequency did not always correspond to the highest revenue.

### 5. Order Outcomes
- 88.00% of orders were delivered successfully.
- Returns accounted for 7.90% of orders.
- Cancellations accounted for 4.10% of orders.

### 6. Returns and Cancellations
- Beauty recorded the highest return rate at **8.19%**.
- Clothing recorded the highest cancellation rate at **4.24%**.
- These categories may benefit from further investigation into return and cancellation reasons.

### 7. Geographic Performance
- Delhi recorded the highest state-level revenue at approximately **₹128.77 million**.
- Lucknow recorded the highest city-level revenue at approximately **₹133.71 million**.
- Revenue was distributed across multiple cities and states.

## 📈 Power BI Dashboard

An interactive Power BI dashboard was developed to monitor business performance.

### Dashboard components
- KPI cards for total revenue, orders, quantity, AOV, return rate, cancellation rate, and average discount
- Monthly revenue trend
- Revenue by product category
- Orders by status
- Top 10 customers by revenue
- Top 10 products by revenue
- Revenue by state
- Interactive slicers for order date, category, and status

DAX measures were created to calculate key metrics, and the dashboard results were validated against SQL analysis.


[ShopEasy Power BI Dashboard](dashboard.png)


##  Business Recommendations

- Investigate pricing, product mix, and performance drivers behind Electronics revenue.
- Review the reasons for returns in Beauty and cancellations in Clothing.
- Consider retention initiatives for high-value customers.
- Monitor frequently ordered products to support inventory planning.
- Use geographic sales patterns to guide regional marketing and logistics.
- Track returns and cancellations regularly through the Power BI dashboard.

##  Project Workflow

1. Business understanding and objective definition
2. Data inspection and validation
3. Data cleaning using Python and Pandas
4. Data import into SQL Server
5. SQL-based business analysis
6. KPI development using DAX
7. Interactive dashboard development in Power BI
8. Business insights and recommendations

##  Suggested Repository Structure

```text
ShopEasy-Ecommerce-Analysis/
│
├── data/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   └── clean_orders.csv
│
├── python/
│   └── data_cleaning.ipynb
│
├── sql/
│   └── analysis_queries.sql
│
├── powerbi/
│   └── ShopEasy_Dashboard.pbix
│
├── images/
│   └── dashboard.png
│
└── README.md
```

Adjust the file names and folders to match your actual repository.

##  Conclusion

This project demonstrates an end-to-end data analytics workflow, from cleaning raw transactional data to analyzing business performance with SQL and presenting findings through Power BI.

The analysis identified major revenue drivers, high-value customers, product performance patterns, order outcome trends, and geographic opportunities. The findings can help guide further investigation into sales performance, customer retention, inventory planning, and operational improvements.

##  Skills Demonstrated

- Data cleaning and validation
- Python and Pandas
- SQL Server and relational joins
- Aggregations and KPI calculations
- Customer and product analysis
- Power BI dashboard development
- DAX measures
- Data visualization
- Business insights and recommendations

