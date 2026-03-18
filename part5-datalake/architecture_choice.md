## Architecture Recommendation

For a fast-growing food delivery startup handling diverse data like GPS logs, customer reviews, payment transactions, and menu images, I would recommend using a Data Lakehouse architecture.

A traditional data warehouse is well-suited for structured data such as payment transactions, but it struggles with unstructured data like text reviews and images. On the other hand, a pure data lake can store all types of data in their raw form, but it lacks strong data management, consistency, and query performance. A data lakehouse combines the strengths of both approaches.

First, it allows the storage of all types of data — structured, semi-structured, and unstructured — in a single system. This is important because the startup deals with everything from numerical transaction data to images and free-text reviews.

Second, it provides better data governance and reliability compared to a traditional data lake. Features like schema enforcement and ACID-like transactions ensure that the data remains consistent and trustworthy, which is critical for financial and operational reporting.

Third, it supports both real-time analytics and advanced use cases like machine learning. For example, the startup can analyze delivery routes using GPS data or perform sentiment analysis on customer reviews.

Overall, a data lakehouse offers flexibility, scalability, and performance, making it the most suitable choice for a rapidly growing and data-driven business.
