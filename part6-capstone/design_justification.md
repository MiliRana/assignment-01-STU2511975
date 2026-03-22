## Storage Systems

The hospital's four goals each require a storage system matched to their data type and access pattern.

**Goal 1 — Predict patient readmission risk:**
Historical treatment records (diagnoses, lab results, discharge summaries) are stored in a **Data Lake (Amazon S3)**. Clinical data arrives in heterogeneous formats (HL7, FHIR, CSV), so a schema flexible lake handles semi-structured and evolving clinical formats without upfront schema constraints. Apache Spark processes this data into cleaned Parquet feature sets, which an XGBoost model consumes for training. Trained model artifacts are versioned in an **MLflow registry**.

**Goal 2 — Plain-English patient history queries:**
Clinical notes are chunked and embedded using a sentence transformer model, stored in a **Vector Database (pgvector on PostgreSQL)**. When a doctor asks a question, it is embedded and a nearest neighbour search retrieves relevant chunks, which an LLM uses to generate a grounded answer (RAG architecture), enabling semantic search beyond simple keyword matching.

**Goal 3 — Monthly management reports:**
Structured operational data (admissions, costs, billing) is loaded nightly into a **Data Warehouse (Amazon Redshift)**. This OLAP store powers Tableau dashboards for bed-occupancy trends and department-wise cost reporting, supporting complex aggregations with high analytical performance.

**Goal 4 — Real-time ICU vitals:**
Device streams (heart rate, SpO2, blood pressure) are ingested via **Apache Kafka** and written to a **time-series database (InfluxDB)**. This supports sub-second bedside alerts, while a secondary sink archives data to the Data Lake for long-term analysis.

---

## OLTP vs OLAP Boundary

The transactional system covers day-to-day clinical operations, admissions, prescriptions, scheduling, and billing stored in a **PostgreSQL RDBMS** with full ACID guarantees. It is optimised for fast row-level reads and writes with strong consistency, ensuring no medication record is lost or bed double-booked.

The analytical boundary begins at the **nightly ETL pipeline (Apache Airflow)**. Each night, Airflow extracts changes from PostgreSQL using Change Data Capture, applies transformations (standardising dates, resolving NULLs, aggregating costs), and loads results into the Data Warehouse. All reporting runs against the warehouse, fully isolated from the live RDBMS, so heavy analytical queries never degrade operational performance.

The real-time vitals stream sits outside this boundary entirely — flowing from Kafka directly into InfluxDB, bypassing both the OLTP store and the warehouse to ensure minimal latency for critical alerts.

---

## Trade-offs

**Trade-off: Operational complexity of a multi-system architecture**

The design uses five specialised storage systems (RDBMS, Data Lake, Data Warehouse, Vector DB, Time-Series DB), each optimised for a different workload. While this improves performance, it increases complexity requiring separate infrastructure, monitoring, and team expertise. Prioritising low-latency ICU processing alongside flexible AI querying also introduces challenges in maintaining cross-system consistency.

**Mitigation:** The hospital should adopt a fully **managed AWS stack** — RDS, S3, Redshift, Amazon Timestream, and pgvector. Managed services handle scaling, backups, and maintenance automatically. A unified **CloudWatch** observability layer centralises monitoring across all components. A phased rollout starting with reporting and streaming before adding ML and RAG — minimises deployment risk.
