# 🛒 Retail Sales Analysis – SQL Project

## 📌 Project Overview

This project focuses on analyzing **Retail Sales data** using **SQL**. The goal is to clean raw sales data, perform exploratory analysis, and extract meaningful business insights such as customer behavior, category performance, time-based trends, and sales patterns.

The project demonstrates practical SQL skills including **data cleaning, aggregation, filtering, window functions, CTEs, and date/time analysis**, making it suitable for **beginner to intermediate Data Analyst roles**.

---

## 🗂️ Database & Table Structure

### Database Name

`Project`

### Table Name

`Retail_Sales`

### Table Schema

| Column Name     | Data Type         | Description           |
| --------------- | ----------------- | --------------------- |
| transactions_id | INT (Primary Key) | Unique transaction ID |
| sale_date       | DATE              | Date of sale          |
| sale_time       | TIME              | Time of sale          |
| customer_id     | INT               | Unique customer ID    |
| gender          | VARCHAR(15)       | Customer gender       |
| age             | INT               | Customer age          |
| category        | VARCHAR(30)       | Product category      |
| quantity        | INT               | Units sold            |
| price_per_unit  | NUMERIC(10,2)     | Price per unit        |
| cogs            | NUMERIC(10,2)     | Cost of goods sold    |
| total_sale      | NUMERIC(10,2)     | Total sale value      |

---

## 🧹 Data Cleaning Steps

* Checked for **NULL values** across all columns
* Removed records containing NULL values to ensure data integrity
* Verified total record count after cleaning

```sql
DELETE FROM Retail_Sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
```

---

## 📊 Key SQL Analysis Performed

### 1️⃣ Sales & Customer Metrics

* Total number of transactions
* Total unique customers
* Unique product categories

### 2️⃣ Date & Category-Based Analysis

* Sales on a specific date
* Clothing sales with quantity > 3 in Nov 2022
* Total sales per category

### 3️⃣ Customer Insights

* Average age of Beauty category customers
* Transactions with total sales greater than 1000
* Top 5 customers by total sales
* Unique customers per category

### 4️⃣ Gender-Based Analysis

* Total transactions by **gender per category**


## 🧠 Query Optimization & Multiple Approaches

### ⏰ Sales by Time Shift (Morning / Afternoon / Evening)

**Business Question:**  
How many orders occur during Morning, Afternoon, and Evening time shifts?

This problem was intentionally solved using **three different SQL approaches** to demonstrate that the **same business question can be answered in multiple ways**, each with different levels of readability, efficiency, and scalability.

#### 🔹 Solution 1: Subquery-Based Approach
- Uses a subquery with a `CASE` statement
- Beginner-friendly and easy to understand
- Clearly separates logic into steps

#### 🔹 Solution 2: Single Query with CASE
- More concise than the subquery approach
- Eliminates unnecessary nesting
- Improves readability and performance

#### 🔹 Solution 3: CTE with Custom Ordering (Recommended)
- Uses a `WITH` clause (CTE)
- Most readable and scalable solution
- Allows logical ordering of shifts (Morning → Afternoon → Evening)
- Closest to **production-level SQL practices**

👉 **The CTE-based solution is considered the final and optimal approach** for real-world use.


---

## 🧠 Advanced SQL Concepts Used

* `GROUP BY` and aggregate functions
* `CASE` statements
* `EXTRACT()` for date & time analysis
* `ROW_NUMBER()` window function
* `CTE (WITH clause)`
* Subqueries
* Data filtering using `WHERE`

---

## 🛠️ Tools & Technologies

* **Database:** PostgreSQL 
* **Language:** SQL
* **Environment:**  pgAdmin
* **Tools for Data Cleaning:** Excel

---

## 🎯 Key Learnings

* Hands-on experience with **real-world sales data**
* Improved understanding of **data cleaning in SQL And Excel **
* Learned to derive **business insights using analytical queries**
* Gained confidence using **window functions and CTEs**

---

## 🚀 Future Improvements

* Add profit analysis (Revenue – COGS)
* Create views for reusable queries
* Index optimization for large datasets
* Dashboard creation using Power BI / Tableau

---

## 👤 Author

**Chandan Mistry**
CSE Student | Aspiring Data Analyst

📧 Contact: *Chandanmistry844@gmail.com*

---

⭐ *If you like this project, feel free to fork, star, or suggest improvements!*
