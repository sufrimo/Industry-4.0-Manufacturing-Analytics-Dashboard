# Manufacturing Dashboard Analysis Using Power BI AND POSTGRESQL

---

## 1. Introduction

This project presents an interactive Power BI dashboard designed for real-time monitoring and performance evaluation of manufacturing equipment. The dashboard connects directly to a PostgreSQL database that stores IoT sensor data, enabling visualization of key Industry 4.0 metrics such as machine availability, downtime patterns, Overall Equipment Effectiveness (OEE), and daily maintenance and idle trends.

---

## 2. Project Description

- Sensor-based machine operation data (Active, Idle, Maintenance) from January to March is stored in PostgreSQL.
- Power BI connects directly to this data source and performs data transformation using Power Query and DAX.
- The dashboard features two interactive filters:
  - **Month Filter:** January through March
  - **Mode of Operation Filter:** Active, Idle, Maintenance
- Visualizations include KPI cards, pie charts, gauges, clustered column charts, tables, and slicers for insightful performance analysis.

---

## 3. Objectives

- Track and visualize machine activity times (active, idle, maintenance).
- Analyze downtime and maintenance patterns to optimize production.
- Measure Overall Equipment Effectiveness (OEE) based on real-time data.
- Visualize efficiency distribution and equipment-specific behavior.
- Provide actionable insights with interactive visualizations.
- Support predictive maintenance efforts to reduce unplanned downtime.

---

## 4. Scope and Limitations

### Scope
- Integration of Power BI with PostgreSQL containing Industry 4.0 machine data.
- Data coverage for January through March.
- Calculation of key metrics: OEE, Availability, Downtime %, and Efficiency Status.
- Visual breakdown by day, week, and machine.

### Limitations
- Dataset limited to 3 months; long-term trends cannot be analyzed.
- Quality component of OEE is estimated due to unavailable max machine speed data.
- Real-time data refresh is not yet implemented; data is batch-loaded.

---

## 5. Methodology

### Data Storage & Extraction
- Sensor data stored in PostgreSQL with machine states and timestamps.
- Power BI connects via Npgsql connector, extracting equipment IDs and timestamps.

### Data Transformation (ETL) in Power Query
- Data cleaning and standardization.
- Date enrichment: extracting day, week, and month for grouping.

### Data Modeling & DAX
- Measures for total time, downtime %, OEE, availability, and efficiency classification.
- Aggregation of daily and weekly metrics for detailed analysis.

---

## 6. Dashboard Visualizations

![OEE Dashboard](https://github.com/sufrimo/Industry-4.0-Manufacturing-Analytics-Dashboard/raw/main/OEE%20DASHBOARD.jpg)


- **KPI Cards:** Active Time, Idle Time, Maintenance Time, OEE, Availability, Downtime %
- **Pie Charts:** Efficiency Status Distribution
- **Clustered Column Charts:** Weekly Output per Machine
- **Gauges:** OEE Monitoring and Downtime %
- **Stacked Columns:** Equipment Time Breakdown
- **Tables:** Daily maintenance and idle time logs
- **Slicers:** Month and Equipment filters
- **Bookmarks:** Toggle between daily and weekly views

---

## 7. Techniques Used

- **PostgreSQL:**
  - Common Table Expressions (CTE) for organizing sensor logs.
  - LEAD() window function to calculate event durations.
  - EXTRACT() to derive day, week, month from timestamps.
  - GROUP BY and ORDER BY for aggregation and sorting.

- **Power Query:**
  - Date-related columns for grouping and filtering.

- **DAX:**
  - Calculations for OEE, availability, downtime, and efficiency classification.

---

## 8. Key Findings

- **Active Time:** 58,410 hours  
- **Idle Time:** 16,633 hours  
- **Maintenance Time:** 8,204 hours  
- **Downtime Percentage:** 29.84%  
- **OEE:** 67%  
- **Availability:** 70%  

### Efficiency Patterns
- Top performing weeks: Weeks 7, 1, and 2 with highest active times.
- Maintenance spikes mostly on Mondays and Saturdays due to planned outages.
- Idle times elevated on Mondays and Saturdays, linked to scheduled maintenance.
- Equipment EQP 05, 14, 24, 32, 33, 38 had frequent maintenance logs.

---

## 9. Recommendations

### Maintenance Scheduling Optimization
- Shift planned maintenance to midweek (Tuesday/Wednesday) to reduce idle peaks on Mondays and Saturdays.
- Midweek scheduling aligns with stable staffing and peak production.
- Research suggests midweek maintenance can reduce unplanned downtime by 30–50%, extend equipment lifespan by 20–40%, and lower costs by 20–35%.
- Improves coordination of spare parts and crew availability, enabling faster recovery.

### Improve Equipment Utilization
- Prioritize audits and recalibration of underperforming equipment to boost efficiency.



