-- 1. Extraer partes utiles de la columna 'Departure_Time'
SELECT *,
  DATE(Departure_Time) AS Fecha_Salida,
  YEAR(Departure_Time) AS Año_Salida,
  MONTH(Departure_Time) AS Mes_Salida,
  DAY(Departure_Time) AS Dia_Salida,
  DAYOFWEEK(Departure_Time) AS Dia_Semana,
  HOUR(Departure_Time) AS Hora_Salida
FROM flight_data;

-- 2. Crear banderas (flags) útiles para análisis de KPIs
SELECT *,
  CASE WHEN Delay_Minutes > 0 THEN 1 ELSE 0 END AS Tiene_Retrazos,
  CASE WHEN Flight_Status = 'On-time' THEN 1 ELSE 0 END AS Vuelo_Puntual,
  CASE WHEN No_Show = 'Yes' THEN 1 ELSE 0 END AS Pasajero_No_Show
FROM flight_data;

-- 3. Verificar nulos en campos importantes
SELECT
  COUNT(*) AS Total_Registros,
  SUM(CASE WHEN Price_USD IS NULL OR Price_USD <= 0 THEN 1 ELSE 0 END) AS Precios_Invalidos,
  SUM(CASE WHEN Flight_Duration_Minutes IS NULL OR Flight_Duration_Minutes <= 0 THEN 1 ELSE 0 END) AS Duraciones_Invalidas,
  SUM(CASE WHEN Distance_Miles IS NULL OR Distance_Miles <= 0 THEN 1 ELSE 0 END) AS Distancias_Invalidas
FROM flight_data;

-- 4. Identificar valores sin texto ''
SELECT COUNT(Frequent_Flyer_Status) AS No_Membership_Flyer
FROM flight_data
WHERE Frequent_Flyer_Status = '';

-- 4.1 Reemplazar valores sin texto
SELECT
CASE WHEN Frequent_Flyer_Status = '' THEN 'No Membership' ELSE Frequent_Flyer_Status END AS Frequent_Flyer_Status
FROM flight_data;

-- 5. Crear vista/ tabla nueva con datos limpios y columnas agregadas
CREATE VIEW flight_data_cleaned AS
SELECT 
  Passenger_ID,
  Flight_ID,
  Airline,
  Departure_Airport,
  Arrival_Airport,
  CASE WHEN Frequent_Flyer_Status = '' THEN 'No Membership' ELSE Frequent_Flyer_Status END AS Frequent_Flyer_Status,
  Check_in_Method,
  Seat_Selected,
  DATE(Departure_Time) AS Fecha_Salida,
  YEAR(Departure_Time) AS Año_Salida,
  MONTH(Departure_Time) AS Mes_Salida,
  DAYOFWEEK(Departure_Time) AS Dia_Semana,
  HOUR(Departure_Time) AS Hora_Salida,
  Price_USD,
  Flight_Duration_Minutes,
  Distance_Miles,
  Delay_Minutes,
  Bags_Checked,
  ROUND(Flight_Satisfaction_Score, 2) AS Flight_Satisfaction_Score,
  Weather_Impact,
  Flight_Status,
  Booking_Days_In_Advance,
  Booking_Lead_Time,
  CASE WHEN Delay_Minutes > 0 THEN 1 ELSE 0 END AS Tiene_Retrazos,
  CASE WHEN Flight_Status = 'On-time' THEN 1 ELSE 0 END AS Vuelo_Puntual,
  CASE WHEN No_Show = 'Yes' THEN 1 ELSE 0 END AS Pasajero_No_Show
FROM flight_data
WHERE Price_USD IS NOT NULL AND Price_USD > 0;