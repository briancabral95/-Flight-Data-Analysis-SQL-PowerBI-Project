# ✈️ Flight Data Analysis – SQL Project  

## 📌 Objetivo del proyecto  
Este proyecto tiene como finalidad **explorar, limpiar y transformar datos de vuelos** utilizando **SQL**, con el objetivo de obtener **KPIs relevantes para la industria aérea**.  

La base de datos incluye información sobre vuelos, pasajeros, aerolíneas, precios, retrasos, métodos de check-in y satisfacción de los clientes.  

---

## 🛠️ Tecnologías utilizadas  
- **SQL** (MySQL)  
- **Power BI**  

---

## 📂 Contenido del proyecto  

### 🔹 1. Exploración inicial (`flight_data_sql_script.sql`)  
- Verificación de estructura de la tabla (`DESCRIBE`, `LIMIT 10`).  
- Conteo de **valores nulos** por columna.  
- Distribución de variables categóricas:  
  - Vuelos por aerolínea.  
  - Métodos de check-in más usados.  
  - Impacto del clima en los vuelos.  
- Estadística descriptiva de variables numéricas (precio y duración de vuelos).  
- Exploración de fechas (rango de fechas, vuelos por mes/año).  
- Análisis de desempeño:  
  - % de vuelos con retrasos.  
  - Puntaje promedio de satisfacción por aerolínea.  
- Identificación de **rutas más frecuentes**.  

### 🔹 2. Limpieza y transformación (`flight_data_view.sql`)  
- Extracción de partes útiles de la fecha de salida (año, mes, día, hora).  
- Creación de **flags** para análisis de KPIs:  
  - Retrasos (`Tiene_Retrazos`).  
  - Vuelos puntuales (`Vuelo_Puntual`).  
  - Pasajeros ausentes (`Pasajero_No_Show`).  
- Validación de datos inválidos (precios, distancias y duraciones).  
- Reemplazo de valores vacíos en el campo de *Frequent Flyer Status*.  
- Creación de la vista `flight_data_cleaned` con datos listos para análisis o dashboards.  

---

## 📊 Insights clave obtenidos  
- El **% de vuelos con retrasos** permite medir la **eficiencia operativa** de las aerolíneas.  
- La **satisfacción promedio por aerolínea** es un KPI crítico para la fidelización de clientes.  
- Los **métodos de check-in más utilizados** ayudan a entender preferencias de los pasajeros y optimizar recursos.  
- El **impacto del clima** en los vuelos revela factores externos que afectan la puntualidad.  
- Las **rutas más frecuentes** permiten identificar mercados clave para las aerolíneas.  

---

## 🚀 Próximos pasos  
- Conectar la vista `flight_data_cleaned` a **Power BI** o **Tableau** para generar dashboards interactivos.  
- Profundizar en análisis predictivo (ej. modelos de probabilidad de retrasos).  
- Incorporar métricas de rentabilidad por ruta o por aerolínea.  

---

## 📌 Autor  
👤 **Brian Cabral**  
