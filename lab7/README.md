# LAB 7 - Analyze Loan Risk Using Window Functions

### Concepts Covered
1. OVER clause
2. Window Functions
    * RANK(), DENSE_RANK() and ROW_NUMBER()
    * Running totals with SUM()
    * LAG() and LEAD()
3. Partitioning Data with PARTITION BY

### Understanding OVER
Windowing data lets one divide data and mutliple entries into groups or treat as one group and perform calculations with the grouping.
For example ranking Accounts by the Balance they hold.

### Codes executed
| | |
|-|-|
| Ranking LoanAmount using `RANK()` | ![](ss7/1.png) |
| Ranking LoanAmount using `DENSE_RANK()` | ![](ss7/2.png) |
| Using `ROW_NUMBER()` | ![](ss7/3.png) |
| Applying `ROW_NUMBER()` after forming group by CustomerID | ![](ss7/4.png) |
| A running sum of `LoanAmount` | ![](ss7/5.png) |
| Using `LAG()` on `LoanAmount` | ![](ss7/6.png) |
| Using `LEAD()` on `LoanAmount` | ![](ss7/7.png) |