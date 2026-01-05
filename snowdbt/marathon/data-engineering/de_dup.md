| Method | Primary Operation Cost | Speed for Large Datasets | Atomicity | Storage Overhead (Temporary) | Use Case |
|------|------------------------|--------------------------|-----------|------------------------------|----------|
| SELECT DISTINCT (to new table) | Full table scan & write | Fast | Yes | High (new table) | Batch deduplication, creating clean snapshots |
| DELETE with QUALIFY | Marking partitions for deletion | Moderate to Slow (large scale) | No | Low | Small to medium tables, targeted deletions where specific duplicates need to be removed |
| SWAP WITH (after CREATE AS) | Full table scan & write (for temp) | Very Fast (swap) | Yes | High (temp table) | Large tables, critical production systems requiring atomic table replacement and minimal downtime |
| INSERT OVERWRITE | Full table scan & write | Fast | Yes | Moderate (staging) | Large tables, simpler in-place rewrite of a table's entire content |
| COPY INTO with SELECT DISTINCT | File scan & write (during ingestion) | Fast (during load) | Yes | Low | Deduplication at ingestion time, preventing duplicates from ever entering the final target table |
