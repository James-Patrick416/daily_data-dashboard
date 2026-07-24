# Sales Data Warehouse 📊

> A complete data warehouse project built entirely in GitHub browser — no local IDE needed. Demonstrates data modeling, advanced SQL, and data quality practices.

## 🎯 Business Problem Solved

This project answers critical business questions:
- Which countries generate the highest revenue?
- Who are our top customers by country?
- How is revenue growing month-over-month?
- What products are underperforming?

## 📁 Project Structure
```

├── tables/                    # Raw data (CSV)
│   ├── customers.csv         # Customer dimension
│   ├── products.csv          # Product dimension
│   └── orders.csv            # Fact table (15 transactions)
├── queries/                   # Analytical SQL
│   ├── revenue_by_country.sql      # JOIN + aggregation
│   ├── top_customers_by_country.sql # Window functions
│   ├── monthly_growth.sql          # LAG + growth calc
│   └── data_quality_checks.sql     # Data validation
└── README.md                 # This portfolio

```
## 🛠️ Skills Demonstrated

- **Data Modeling**: Star schema with fact + dimension tables
- **Advanced SQL**: JOINs, window functions, CTEs, LAG
- **Data Quality**: Null, duplicate, orphan, and consistency checks
- **Business Intelligence**: Revenue analytics, customer insights
- **Version Control**: Full Git workflow in browser

## 📊 Key Insights (Sample Output)

| Country | Revenue | Top Customer |
|---------|---------|--------------|
| USA | $2,813 | Emily Brown |
| UK | $910 | Maria Garcia |
| India | $150 | Sarah Patel |
| Canada | $50 | Robert Chen |

## 🚀 How to Run

1. Copy any query from `queries/` folder
2. Paste into [SQLite Online](https://sqliteonline.com/)
3. Upload the 3 CSV files from `tables/`
4. Execute and see results!
   
