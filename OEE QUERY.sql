CREATE TABLE ManufacturingData (
    Timestamp TIMESTAMP NOT NULL,
    Machine_ID INT NOT NULL,
    Operation_Mode VARCHAR(50),
    Temperature_C FLOAT,
    Vibration_Hz FLOAT,
    Power_Consumption_kW FLOAT,
    Network_Latency_ms FLOAT,
    Packet_Loss FLOAT,
    Quality_Control_Defect_Rate FLOAT,
    Production_Speed_units_per_hr FLOAT,
    Predictive_Maintenance_Score FLOAT,
    Error_Rate_ FLOAT,
    Efficiency_Status VARCHAR(10),  -- 'High', 'Medium', or 'Low'
    PRIMARY KEY (Timestamp, Machine_ID)
);

SELECT * FROM ManufacturingData
LIMIT 100;

--Use CTE to pair each operation mode with its start and end timestamp (based on next row)
--Calculate duration for each operation mode segment
--LEAD() retrieves the next row timestamp

-- Calculate total duration in minutes for each operation mode
-- EXTRACT(EPOCH FROM interval) gives seconds; divide by 60 to get minutes

WITH ModeDurations AS (
  SELECT 
    Machine_ID,
    Operation_Mode,
    Timestamp AS Start_Time,
    LEAD(Timestamp) OVER (
      PARTITION BY Machine_ID ORDER BY Timestamp
    ) AS End_Time
  FROM ManufacturingData
)

SELECT 
  DATE(Start_Time) AS LogDate,
  Machine_ID,
  Operation_Mode,
  SUM(EXTRACT(EPOCH FROM (End_Time - Start_Time)) / 60) AS Total_Minutes
FROM ModeDurations
WHERE End_Time IS NOT NULL
GROUP BY 
  DATE(Start_Time),
  Machine_ID,
  Operation_Mode
ORDER BY 
  LogDate,
  Machine_ID,
  Operation_Mode;

--GET AVERAGE DEFECT RATE ESTIMATE DEFECTIVE UNITS BY ACTIVE OPERATION MODE
SELECT 
  Machine_ID,
  Timestamp,
  AVG(Quality_Control_Defect_Rate) AS Avg_Defect_Rate,
  AVG(Power_Consumption_kW) AS Avg_Power_Consumption_kW,
  AVG(Error_Rate_) AS Avg_Error_Rate,
  AVG(Predictive_Maintenance_Score) AS Avg_Predictive_Maintenance_Score,
  AVG(Temperature_C) AS Avg_Temperature_C,
  AVG(Vibration_Hz) AS Avg_Vibration_Hz,
  AVG(Packet_Loss) AS Avg_Packet_Loss,
  AVG(Production_Speed_units_per_hr) AS Avg_Production_Speed_units_per_hr
FROM ManufacturingData
WHERE Operation_Mode = 'Active'
GROUP BY Machine_ID,Timestamp
ORDER BY Machine_ID ASC;






