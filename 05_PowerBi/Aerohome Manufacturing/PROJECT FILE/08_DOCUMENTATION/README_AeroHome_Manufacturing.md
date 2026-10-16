# AeroHome Manufacturing Analytics --- Power BI Project

## Project Overview

AeroHome Manufacturing Analytics is a Power BI dashboard project
designed to help monitor manufacturing performance across production,
quality, maintenance, energy, finance, procurement, materials, and
workforce operations.

The report is organized into nine dashboard pages, with shared filters
such as date range, plant, product category, and material type where
applicable.

> **Data note:** KPI values shown in dashboard screenshots and project
> notes are example figures. Validate all figures against the final
> Power BI model and current slicer selections before presenting them as
> official business results.

## Dashboard Pages

1.  **Executive Overview** --- High-level production, quality, downtime,
    energy, procurement, and estimated defect-cost KPIs.
2.  **Production & Plant Performance** --- Planned versus produced
    units, production achievement, and plant/category comparisons.
3.  **Machine & Downtime Analysis** --- Downtime patterns and equipment
    performance.
4.  **Quality Analysis** --- Defect units, defect rates, and estimated
    defect-cost exposure.
5.  **Operational Efficiency** --- Production achievement, energy
    consumption, energy per unit, and plant/shift efficiency.
6.  **Finance & Cost Analysis** --- Procurement spend, production cost,
    potential production value, defect cost exposure, and unit margin.
7.  **Procurement & Supplier Performance** --- Purchase orders, delayed
    orders, supplier spend, lead times, ratings, and delivery status.
8.  **Materials & Supply Chain Risk** --- Material dependency, standard
    cost, product-material relationships, and potential supply risk.
9.  **Operator & Shift Performance** --- Operator production, defects,
    downtime, experience, and shift comparisons.

## Key KPIs

-   Total Planned Units
-   Total Produced Units
-   Production Achievement %
-   Total Defective Units
-   Defect Rate %
-   Total Downtime (minutes)
-   Total Energy Consumed (kWh)
-   Energy per Unit (kWh)
-   Procurement Spend
-   Estimated Defect Cost Exposure
-   Delayed Orders and Delay Rate %
-   Total Materials and Product-Material Dependencies
-   Operator and Shift Performance indicators

The exact KPI availability depends on the tables and columns present in
the final data model.

## Tools and Technologies

-   **Microsoft Power BI Desktop** --- report pages, visuals, slicers,
    and dashboard interactions
-   **DAX** --- calculated measures and KPI logic
-   **Data modeling** --- fact and dimension tables, relationships, and
    filter context
-   **Excel / CSV or database sources** --- depending on the project's
    actual input files

## Repository Structure

``` text
AEROHOME_MANUFACTURING_PROJECT/
├── 01_DATASET/
├── 02_POWER_BI_REPORT/
├── 03_SCREENSHOTS/
├── 04_DAX_MEASURES/
│   └── AeroHome_DAX_Measures.txt
├── 05_DOCUMENTATION/
├── 06_INSIGHTS/
│   └── AeroHome_Manufacturing_Key_Insights.txt
└── 07_RECOMMENDATIONS/
    └── AeroHome_Manufacturing_Recommendations.txt
```

Folder and file names may differ slightly in the repository. Keep this
structure aligned with the files actually committed.

## Important Measures

The DAX reference file contains starter measures for:

-   Production achievement and variance
-   Defect rate and estimated defect cost exposure
-   Downtime and energy consumption
-   Procurement spend and supplier delivery performance
-   Material and product dependencies
-   Operator and shift performance
-   Previous-period comparisons
-   Validation and troubleshooting

**Before using the measures:** replace sample table and column names
with the exact names in your Power BI model. Check data types,
relationships, filter context, and the underlying business definitions.

## Data Model and Validation

Before publishing the report:

1.  Confirm that dimension keys are unique.
2.  Create and mark a continuous Date table where appropriate.
3.  Establish active relationships between shared dimensions and
    relevant fact tables.
4.  Verify that Date, Plant, Product Category, Material Type, and Shift
    filters affect the intended visuals.
5.  Reconcile KPI totals with source data.
6.  Check that operator-level visuals filter production and downtime
    records correctly.
7.  Format units and percentages consistently.
8.  Avoid interpreting a 100% stacked chart as actual production volume;
    use a standard stacked or clustered chart when actual quantities are
    needed.

## Business Insights

The insights document groups observations across production, plant
performance, downtime, quality, energy, finance, procurement, materials,
and workforce performance. Treat these as analytical prompts until the
final report data confirms them.

## Recommendations

The recommendations document suggests practical follow-up actions,
including:

-   Investigating verified production shortfalls
-   Prioritizing major defect contributors and defect-cost exposure
-   Reviewing recurring downtime and preventive maintenance
-   Monitoring energy per unit
-   Evaluating supplier delays and lead times
-   Assessing high-cost and high-dependency materials
-   Comparing operator and shift results with appropriate operational
    context
-   Tracking action owners, due dates, baselines, targets, and measured
    outcomes

These recommendations are not proof that a specific plant, supplier,
machine, or operator is underperforming.

## How to Use the Project

1.  Download or clone the repository.
2.  Open the `.pbix` report in Power BI Desktop, if included.
3.  Refresh the data using the configured source and credentials.
4.  Review relationships and DAX measures.
5.  Set the date range and slicers to the period you want to analyze.
6.  Validate KPI values and visual interactions before sharing the
    report.

## Limitations

-   The exact data source, schema, and refresh process depend on the
    final project files.
-   Sample dashboard values may differ between pages or screenshots
    because of different report versions or filter states.
-   Some analyses require fields such as machine, defect reason,
    supplier lead time, operator ID, or material-level spend. If these
    fields are absent, the related visual or measure must be adapted.

## Author

**Karthick V**\
Data Analytics Portfolio Project

## Disclaimer

This project is intended for learning, portfolio demonstration, and
analytical practice. Do not treat example metrics as audited operational
or financial results.
