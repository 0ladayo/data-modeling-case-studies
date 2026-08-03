# Data Modeling Case Studies

A place for end-to-end data modeling work: OLTP design through to a warehouse built with dbt.

Right now there's one project in here:

| Project | What it covers |
| --- | --- |
| [Oil & Gas](./end-to-end%20modelling%3B%20oil%20and%20gas%20case%20study) | Relational source model for fields, reservoirs, wells, and production, then a Kimball star schema on BigQuery with dbt, including SCD Type 2 on wells |

Stack I've been using: PostgreSQL for the source schema, BigQuery + dbt for the warehouse, Git for version control.
