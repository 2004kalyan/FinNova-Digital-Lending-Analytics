# FinNova — Key Business Insights

## 1. Portfolio Scale

The analyzed portfolio contains **48,702 disbursed loans** with approximately **₹72.72 Cr** in total disbursed value.

This provides the base portfolio population for the credit-risk, delinquency and collections analysis.

## 2. Portfolio Default Rate

The Power BI analytical model reports a **5.20% portfolio default rate**, corresponding to **2,531 defaulted loans**.

For this project, default is based on the project-specific **90+ DPD convention**.

## 3. Delinquency Concentration

The latest DPD distribution is:

| Latest DPD Bucket | Loans |
|---|---:|
| Current | 42,919 |
| 1–30 | 1,540 |
| 31–60 | 1,065 |
| 61–89 | 284 |
| 90+ | 308 |

There are **308 loans currently at 90+ DPD**.

The 61–89 DPD bucket is also relevant because these accounts are already severely delinquent but have not yet reached the project's 90+ DPD default threshold.

## 4. Overdue Exposure

The Power BI model reports approximately **₹22.78 Cr in total overdue amount**.

Loan count and financial exposure should both be monitored because a relatively small number of accounts can represent a significant amount of financial exposure.

## 5. Risk Segment Pattern

Observed default rates across the project's risk segments are:

| Risk Segment | Observed Default Rate |
|---|---:|
| Moderate | 7.01% |
| Medium | 6.19% |
| Low | 5.32% |
| Very Low | 4.55% |

“Observed default rates are higher in the higher-risk segments within this synthetic portfolio.”

This is a descriptive relationship within the synthetic dataset and should not be interpreted as proof that risk grade alone causes default.

## 6. Customer Type Pattern

Existing customers had an observed approval rate of approximately **74.79%**, compared with approximately **39.58%** for new customers.

The project also found a lower observed default rate among existing customers than new customers.

These are portfolio observations and should be considered alongside other borrower and loan characteristics.

## 7. Acquisition Channel

Default rates differ across acquisition channels in the analytical model.

Channel comparisons should be interpreted using both portfolio quality and portfolio volume. A channel with a higher default rate may have a different customer mix, loan mix or portfolio size.

## 8. Collections

The portfolio contains:

- **31,477 collection actions**
- Approximately **₹12.49 Cr** in recorded collection amount
- **20,815 loans** with collection activity

Collection actions include Call, SMS, Promise to Pay, Email and Field Follow-up.

Total collection amount by action should not by itself be interpreted as action effectiveness because action volume, exposure and account mix differ.

## 9. Portfolio Monitoring Implication

The dashboard indicates that management should monitor portfolio growth together with:

- Default rate
- Delinquency rate
- 90+ DPD loans
- Overdue amount
- Outstanding principal
- Collection amount
- Recovery outcomes

Looking at these indicators together provides more context than relying on a single KPI.

## 10. Analytical Caveats

- The dataset is synthetic.
- The 90+ DPD default rule is specific to this project.
- Latest DPD is a point-in-time measure.
- Maximum DPD represents the worst observed delinquency and is not the same as latest DPD.
- Segment differences are descriptive associations, not causal conclusions.
- Recent loan cohorts may not have had sufficient time to mature to 90+ DPD.
- Collection amount alone does not establish collection effectiveness.
