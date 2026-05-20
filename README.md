# 📊 Superstore Sales Performance Dashboard

**Workflow:** Excel (cleaning) → SQL (analysis) → Power BI (dashboard)

---

## 📋 The Business Problem

A retail company with operations across the US needed to understand why certain 
regions and product categories were losing money despite strong sales volume. 
This project identifies where revenue is leaking and recommends specific actions.

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| Excel | Data cleaning & preprocessing |
| SQL Server | Business queries & insights |
| Power BI | Interactive dashboard |

---

## 📁 Dataset

- **Source:** [Kaggle Superstore Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- **Size:** ~10,000 rows
- **Fields:** Orders, Sales, Profit, Discount, Customer, Region, State

---

**Data Preparation (Excel):**
- Removed blank rows and standardized date formats
- Added `Profit_Margin_%` column: `= Profit/Sales × 100`
- Added `Delivery_Days` column: `= Ship Date − Order Date`

---

## ❓ Business Questions Answered

1. Which region generates the highest revenue and profit?
2. Which product category is most/least profitable?
3. What is the monthly sales trend over 4 years?
4. Which customer segment drives the most revenue?
5. Which states have high sales but negative profit?
6. How do discount levels impact profitability?
7. Who are the Top 10 customers by revenue?

---

## 📸 Dashboard Preview

![Dashboard Preview](dashboard/DASHBOARD.PNG)
*Dashboard showing All Years view. Hover over map bubbles to see 
state-level profit/loss. Year slicer filters all visuals simultaneously.*

---

## 🔍 Key Business Insights

- High discounts (40%+) **significantly hurt profitability** across all regions
- **Texas, Ohio & Pennsylvania** show high sales but **negative profit** 
  (Texas: $170K sales / −$25K profit; Ohio: $78K sales / −$17K profit)
- Technology is the highest revenue-generating category
- Top 10 customers spend **~$14K each on average — nearly 5x** the dataset 
  average of ~$2.9K per customer, all concentrated in the **Consumer segment**

---

## 💡 Business Recommendation

Discount rates above 40% consistently result in negative profit margins across 
all regions. **Immediate action:** cap discounts at 20% for Furniture and Office 
Supplies categories in Texas, Ohio, and Pennsylvania — these three states alone 
show $50K+ in losses despite strong sales volume.

---

## 🧠 SQL Analysis Covers

| # | Business Question |
|---|---|
| 1 | Revenue & profit by region |
| 2 | Most/least profitable categories |
| 3 | Monthly sales trend (2014–2017) |
| 4 | Revenue by customer segment |
| 5 | Loss-making states |
| 6 | Discount impact on profitability (CTE) |
| 7 | Top 10 customers by revenue |
| 8 | Top 10 customer revenue concentration (% of total) |

📄 Queries: [`sql/analysis_queries.sql`](sql/analysis_queries.sql)

---

## 📂 Project Structure

```
superstore-sales-dashboard/
├── dataset/
│   ├── Superstore_raw.csv
│   └── Superstore_mysql.csv
├── sql/
│   └── analysis_queries.sql
├── dashboard/
│   ├── dashboard.png
│   └── sales_dashboard.pbix
└── README.md
```
---

## ▶️ How to Run

1. Download dataset from `dataset/Superstore_mysql.csv`
2. Import into MySQL using Table Data Import Wizard
3. Run queries from `sql/analysis_queries.sql`
4. Open `dashboard/sales_dashboard.pbix` in Power BI Desktop

---

## 👤 Author

**Sai Koushik Jodu** — Aspiring Data Analyst | SQL • Python • Power BI  
[LinkedIn](https://www.linkedin.com/in/jodusaikoushik) | [GitHub Portfolio](https://github.com/jodusaikoushik-hash)


