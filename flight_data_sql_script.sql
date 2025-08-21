-- 1. Ver la estructura de la tabla
SELECT * FROM flight_data LIMIT 10;

-- 1.1 Identificar columnas y tipos de datos
DESCRIBE flight_data;

-- 2. Detectar valores nulos por columna
SELECT
	COUNT(*) AS total_filas,
    SUM(CASE WHEN Passenger_ID IS NULL THEN 1 ELSE 0 END) AS nulls_passenger_id,
    SUM(CASE WHEN Flight_ID IS NULL THEN 1 ELSE 0 END) AS nulls_flight_id
FROM flight_data;

-- 3. Distribución de variables categóricas

-- 3.1 Vuelos por Aerolíneas
SELECT Airline, COUNT(*) AS Total_Vuelos
FROM flight_data
GROUP BY Airline
ORDER BY total_vuelos DESC;

-- 3.2 Método de Check-In más utilizado
SELECT Check_in_Method, COUNT(*) AS Total
FROM flight_data
GROUP BY Check_in_Method
ORDER BY total DESC;

-- 3.3 Vuelos afectados por condiciones climáticas
SELECT Weather_Impact, COUNT(*) AS Total
FROM flight_data
GROUP BY Weather_Impact
ORDER BY total DESC;

-- 4. Estadística básica de columnas numéricas

-- 4.1 Precio Máximo, Mínimo, Promedio y Desviación Estándar
SELECT
  MIN(Price_USD) AS Precio_Min,
  MAX(Price_USD) AS Precio_Max,
  ROUND(AVG(Price_USD), 2) AS Precio_Promedio,
  ROUND(STDDEV(Price_USD), 2) AS Precio_Std
FROM flight_data;

-- 4.2 Duración de vuelo Máxima, Mínima, Promedio y Desviación Estándar
SELECT
  MIN(Flight_Duration_Minutes) AS Duracion_Min,
  MAX(Flight_Duration_Minutes) AS Duracion_Max,
  ROUND(AVG(Flight_Duration_Minutes), 2) AS Duracion_Promedio,
  ROUND(STDDEV(Flight_Duration_Minutes), 2) AS Duración_Std
FROM flight_data;

-- 5. Explorar fechas registradas

-- 5.1 Rango de fechas
SELECT
  MIN(Departure_Time) AS Fecha_mas_Antigua,
  MAX(Departure_Time) AS Fecha_mas_Reciente
FROM flight_data;

-- 5.2 Vuelos por mes/año
SELECT
  YEAR(Departure_Time) AS Año,
  MONTH(Departure_Time) AS Mes,
  COUNT(*) AS Total_Vuelos
FROM flight_data
GROUP BY año, mes
ORDER BY año, mes;

-- 6 Análisis de desempeño

-- 6.1 Porcentaje de vuelos con retraso
SELECT
  COUNT(*) AS total_vuelos,
  SUM(CASE WHEN Delay_Minutes > 0 THEN 1 ELSE 0 END) AS Vuelos_Retrasados,
  ROUND(SUM(CASE WHEN Delay_Minutes > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Porcentaje_Retraso
FROM flight_data;

-- 6.2 Puntaje promedio de satisfacción por aerolínea
SELECT Airline, ROUND(AVG(Flight_Satisfaction_Score), 2) AS Satisfaccion_Promedio
FROM flight_data
GROUP BY Airline
ORDER BY satisfaccion_promedio DESC;

-- 7. Rutas frecuentes

SELECT 
Departure_Airport, 
Arrival_Airport, 
COUNT(*) AS total_vuelos
FROM flight_data
GROUP BY Departure_Airport, Arrival_Airport
ORDER BY total_vuelos DESC
LIMIT 10;