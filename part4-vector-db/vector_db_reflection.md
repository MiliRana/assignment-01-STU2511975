## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for a system where lawyers need to search through long, complex contracts using plain English questions. Keyword search works by matching exact words, which means it may miss relevant information if the wording in the contract is different from the query. For example, a lawyer might search for “termination clauses,” but the contract could use different phrasing like “conditions for ending the agreement.” In such cases, a keyword-based system may fail to return the correct results.

On the other hand, a vector database is designed to understand the meaning behind the text rather than just matching keywords. It uses embeddings to represent both the query and the contract content in a numerical form, allowing it to find semantically similar matches. This means even if the wording is different, the system can still identify relevant sections of the document.

In this scenario, the contracts can be broken down into smaller chunks, converted into embeddings, and stored in a vector database. When a user asks a question, the query is also converted into an embedding and compared with the stored data to find the most relevant sections.

Therefore, a vector database plays a crucial role by enabling semantic search, improving accuracy, and making it easier for lawyers to quickly find the information they need without manually scanning large documents.
