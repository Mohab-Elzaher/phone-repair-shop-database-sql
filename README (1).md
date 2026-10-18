# Phone Repair Shop Database (SQL)

A normalized relational database for a phone repair shop, with queries that analyze repair volume and technician workload.

## Goal
Design a database that tracks customers, their devices, technicians, and repairs, then use SQL to answer real business questions.

## Database Design
Four related tables:

| Table | Purpose |
| --- | --- |
| `Customers` | Customer contact information |
| `Devices` | Devices brought in, linked to customers |
| `Technicians` | Technicians who perform repairs |
| `Repairs` | Each repair job, linked to a device and a technician |

The tables are normalized to remove duplicate data and connected with primary and foreign keys.

## Example Questions Answered
- How many repairs does the shop complete, and how does volume change over time?
- Which technicians handle the most repairs?
- Which devices or issues come in most often?

These are answered with `JOIN` and `GROUP BY` queries.

## Tools
- SQL (MySQL / PostgreSQL)
- Relational database design and normalization

## Files
| File | Description |
| --- | --- |
| `schema.sql` | Creates the tables and relationships |
| `queries.sql` | Analysis queries |

## Author
**Mohab Elzaher**: Information Science (Health Informatics) student at the University of South Florida
[LinkedIn](https://www.linkedin.com/in/mohabelzaher)
