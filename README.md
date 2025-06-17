# Hospital Analysis Project

This project provides an end-to-end data analysis pipeline for hospital data using Python and SQL. It includes data preprocessing, exploratory data analysis (EDA), and an interactive dashboard with Streamlit.

---

## 📊 Features

- Clean and analyze hospital data using Python (Pandas, NumPy, etc.)
- Build visual insights through a Streamlit dashboard
- Perform SQL-based analysis in MySQL using `hospital_analysis.sql`
- End-to-end workflow from data ingestion to visualization

---

## 🧠 SQL File Overview (`hospital_analysis.sql`)

The SQL file includes:

- Table creation statements (`patients`, `doctors`, `appointments`, etc.)
- Data insertion examples
- Analytical queries for:
  - Most consulted doctor
  - Most common diagnoses
  - Average patient visit duration
- Useful SQL views and stored procedures for dynamic analysis

> 💡 You can run this file in MySQL Workbench to set up your analysis environment.

---

## 🛠️ How to Run

### 1. Clone the Repository

```bash
git clone https://github.com/Merlinantony1810/Hospital_analysis.git
cd Hospital_analysis
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

```bash
streamlit run hospital.py
```

### 📌 Requirements

Python 3.8+
Streamlit
Pandas, NumPy, Matplotlib, Seaborn
MySQL or any SQL environment (for .sql file)


---

### 🖼️ Dashboard Screenshots

The following visuals are part of the Streamlit dashboard.
You can also find all images directly in the [images/](https://github.com/Merlinantony1810/Hospital_analysis/tree/main/images)
 folder.

💰 Total Revenue by Treatment Type
🧑‍⚕️ Top Doctor Consultations
👥 Patient Demographics
📊 Dashboard Overview


