+++
title = "1099 contractors can earn ~7% more by reporting their expenses."
description = "More than you even wanted to know about Form 1099."
date = "2026-06-09T00:00:00Z"
url = "https://taylor.town/expenses-000"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-06-10T21:35:39.910882039Z"
seen = false
+++

 img, main\>p:has(img) { max-width: 55ch; } @media (min-width: 550px) { main\>p:has(img) { margin-left: 4rem; } } .chart { max-width: 35rem; } .chart svg { width: 100%; height: auto; display: block; font: 13px sans-serif; } .chart .axis { fill: #718096; } .chart .grid { stroke: rgba(127, 127, 127, 0.18); stroke-width: 1; } .chart .legend { display: flex; flex-wrap: wrap; gap: 0.3rem 1rem; margin-top: 0.5rem; font-size: 0.85rem; margin-left: 2.5rem; } .chart .legend span { display: inline-flex; align-items: center; gap: 0.4rem; } .chart .legend i { display: inline-block; width: 0.85rem; height: 0.85rem; border-radius: 2px; }

**tl;dr:** *If you earn considerable 1099 income in the US, report your business expenses to the IRS.*

Federal Income Tax
----------

Tariffs funded most US government spending until 1913.

0%25%50%75%100%1850190019502000

CustomsExciseCorporateIndividualPayrollOther

The composition of US federal receipts, *via [census.gov](https://www.census.gov/library/publications/1975/compendia/hist_stats_colonial-1970.html) and [whitehouse.gov](https://www.whitehouse.gov/omb/budget/historical-tables/)*.

After the 16th Amendment legalized federal income tax, Congress levied it via the 1913 Revenue Act: a 1% income tax on high-earners (top \~2% of households).

0%25%50%75%100%1850190019502000

Owe no federal income taxOwe federal income tax

Share of US households owing no federal income tax, *via [IRS SOI](https://www.irs.gov/statistics/soi-tax-stats-individual-time-series-statistical-tables) and [Tax Policy Center](https://taxpolicycenter.org/fiscal-facts/who-will-pay-no-federal-individual-income-tax-2025)*.

To finance participation in World War I, the US expanded federal income taxation via the 1917 War Revenue Act. The government required entities to report income-like payments (i.e. interest, rent, dividends, wages) to the Bureau of Internal Revenue (which later became the IRS). The form for reporting such payments became known as Form 1099.

It goes like this:

1. Before paying a contractor, the payer collects a Form W-9 (personal information) from the payee.
2. Each tax season, the payer submits Form 1099 (payment history) to the IRS and the payee.
3. The payee reports their 1099 income on Form 1040 (individual income tax return) and sends the IRS a calculated portion of that income.

0%5%10%15%20%1850190019502000

Median household tax rateAvg. household tax rate

Effective federal income and payroll tax rate, *via [CBO](https://www.cbo.gov/topics/taxes), and [Tax Policy Center](https://www.taxpolicycenter.org/)*. The average line aggregates the full payroll tax (employer and employee), but the median line only counts the employee share -- the gap reflects payroll incidence, not just progressive taxation.

To finance participation in World War II, the US expanded federal income taxation via the 1943 Current Tax Payment Act. This act required employers to withhold taxes from employee paychecks and send those funds directly to the government. Employers record the wages/withholdings on Form W-2, which employees report to the IRS via Form 1040 (individual income tax return).

0%10%20%30%1850190019502000

All taxes (federal, state & local) as a share of GDP, via *[usgovernmentrevenue.com](https://www.usgovernmentrevenue.com/) and [OECD](https://www.oecd.org/en/publications/revenue-statistics-2025_07ca0a8e.html)*.

Nowadays, income is reported in many different flavors:

|  Form   |                    Reports                    |    Issued by     |
|---------|-----------------------------------------------|------------------|
|   W-2   |Wages, salary, and tax withheld from a paycheck|     Employer     |
|1099-NEC |   Nonemployee compensation (contractor pay)   |  Client / payer  |
|1099-MISC|   Rent, royalties, prizes, and other income   |      Payer       |
| 1099-K  |       Card and payment-app settlements        | Stripe, PayPal…  |
|1099-INT |                Interest income                |       Bank       |
|1099-DIV |          Dividends and distributions          |    Brokerage     |
| 1099-B  |   Proceeds from broker and barter exchanges   |    Brokerage     |
| 1099-R  |     Retirement and pension distributions      |Plan administrator|
| 1099-G  |  Government payments (refunds, unemployment)  |    Government    |
| 1099-S  |           Real estate sale proceeds           |  Closing agent   |
| 1099-C  |                Cancelled debt                 |      Lender      |

Meanwhile, self-employment is trending toward extinction. The modern wage economy swallowed self-governed farmers, artisans, shopkeepers, etc.

0%25%50%75%100%18001850190019502000

Self-employed (1099-like)Wage & salary (W-2-like)

Independent vs wage-and-salary workers, *via [Lebergott/Census/BLS](https://www.nber.org/system/files/chapters/c1567/c1567.pdf)*.

Contractors secure freedom at the cost of US employment protections (e.g. minimum wage, overtime pay, unemployment insurance, workers' compensation) and guarantees (e.g. workplace healthcare mandates).

Business Expenses
----------

The original 1913 Revenue Act permitted business expense deductions. The 1918 Revenue Act refined these allowances for individuals:

>
>
> All the ordinary and necessary expenses paid or incurred during the taxable year in carrying on any trade or business, including a reasonable allowance for salaries or other compensation for personal services actually rendered; and rentals or other payments required to be made as a condition to the continued use or possession, for purposes of the trade or business, of property to which the taxpayer has not taken or is not taking title or in which he has no equity.
>
>

The IRS adheres to the Internal Revenue Code (IRC), which codifies legislation (and court rulings) into enforceable statutes. The core of business expense deductions is defined in IRC §162:

>
>
> There shall be allowed as a deduction all the *ordinary* and *necessary* expenses *paid or incurred during the taxable year* in *carrying on any trade or business*.
>
>

Let's break that sentence down:

* **Ordinary**: common and accepted in the trade or business, even if not habitual for the particular taxpayer. A once-in-a-lifetime lawsuit defending the business is ordinary; paying off someone else's bankrupt company's debts to burnish your own reputation [is not](https://supreme.justia.com/cases/federal/us/290/111/).
* **Necessary**: "appropriate and helpful" to the business, not strictly indispensable.
* **Paid or incurred during the taxable year**: distinguishes deductible operating expenses from capital expenditures, which must be capitalized and depreciated over time. A $30 stapler is an operating expense you write off now; a $30,000 cargo van is a capital expenditure you recover over years (though §179 and bonus depreciation often let you expense it immediately anyway).
* **Carrying on any trade or business**: the activity must be a real, profit-motivated trade or business, not a hobby.

When you buy a long-lived asset (a van, a camera rig, a server rack), the IRS assumes it loses value gradually, so you deduct a slice of its cost each year over an IRS-defined "recovery period" (typically 3–7 years for equipment). In practice, §179 expensing and bonus depreciation let most small businesses skip the schedule and deduct the whole purchase in year one.

Business expenses are "above the line": they reduce your income *before* the standard deduction is applied. You need not itemize nor optimize -- qualified deductions stack atop the standard deduction that everyone receives.

Common deductions include:

* **Home office**: Rent/mortgage interest, utilities, insurance, depreciation. Part of the home must be used "regularly and exclusively" as the contractor's principal place of business. Two methods: the *actual-expense* method (calculated on Form 8829) and the *simplified method* (flat $5/ft² rate, up to 300 square feet, capped at $1,500 per year).
* **Vehicle expenses**: Contractors choose between the *standard mileage rate* (set by the IRS each year) and the *actual-expense method* (gas, oil, repairs, insurance, depreciation, lease payments × business-use percentage). The choice generally must be made in the vehicle's first year of business use; once actual expenses with accelerated depreciation are claimed, the standard rate is unavailable in later years.
* **Equipment, supplies, and software**: Computers, phones, tools, software subscriptions; longer-lived assets can often be expensed in full in the year of purchase or as bonus depreciation.
* **Self-employment tax deduction**: One-half of the contractor's 15.3% self-employment tax is deductible.
* **Self-employed health insurance**: Premiums for the contractor (and family) are deductible above the line (if not otherwise eligible for an employer plan).
* **Retirement plan contributions**: SEP-IRAs, Solo 401(k)s, and SIMPLE IRAs allow substantially higher tax-deferred contributions than ordinary IRAs, and the contributions reduce taxable self-employment income.
* **Qualified Business Income (QBI) deduction**: Most pass-through business owners may deduct up to 20% of qualified business income. QBI is your net business profit (1099 income minus expenses) excluding capital gains, interest, dividends, self-paid wages.
* **Professional development**: Continuing education and licensing fees that maintain or improve skills in the contractor's *current* trade are deductible; education that qualifies the contractor for a *new* trade is not.
* **De minimis safe harbor**: Tangible property up to $2,500 per item may be expensed immediately, no depreciation schedule required.
* **Standard meal allowance**: Instead of tracking actual meal costs while traveling, deduct the federal per-diem rate, which [varies by location](https://www.gsa.gov/travel/plan-book/per-diem-rates).
* **Other**: Advertising and marketing, professional fees (legal, accounting), bank and merchant-processing fees, business insurance, contract labor paid to subcontractors (may trigger a 1099-NEC filing obligation of your own), business meals (50% deductible), and travel away from home.

Things that are **not** business expenses:

* **Personal expenses**: the costs of being a person rather than a business: groceries, everyday clothing, rent on personal living space. Mixed-use items (a phone, a car, an internet plan) must be split by business percentage.
* **Commuting** from home to a regular place of business (even for contractors). The trip from a home office to a client site, by contrast, is generally deductible because the home office *is* the business location.
* **Entertainment expenses**: Client entertainment (sports tickets, concerts, golf outings) can not be deducted, even when business is discussed. Business *meals* remain 50% deductible.
* **Fines and penalties**: Parking tickets, speeding tickets, and government penalties are never deductible, even when incurred on business.
* **Political contributions and lobbying**: Campaign donations and lobbying costs are not deductible, even if the outcome affects your business.
* **Capital expenditures**: Must be depreciated, not immediately expensed.
* **Unreimbursed employee business expenses**: W-2 employees cannot deduct out-of-pocket work costs; the deductions in this essay belong to 1099 income on Schedule C.

Bookkeeping
----------

Treasury Regulation §1.6001-1 requires taxpayers to document their tax liability. A complete transaction ledger generally contains (1) amount, (2) date, (3) place, (4) business purpose, and (5) the business relationship. These metadata are naturally recorded by receipts, bank/credit-card statements, invoices, etc.

If records are imperfect but a business expense was clearly incurred, the Cohan rule allows courts to estimate the deduction "bearing heavily, if it chooses, upon the taxpayer whose inexactitude is of his own making."

IRC §274(d) forbids estimation for heavily abused categories: travel, meals, gifts, and "listed property" (chiefly vehicles).

You don't need an LLC or a corporation to deduct expenses. Anyone who earns self-employment income is a sole proprietor by default. The structure only changes which form the income lands on (and how much paperwork you sign up for).

|        Structure         |  Tax ID  |   Income reported on   |                     Notes                      |
|--------------------------|----------|------------------------|------------------------------------------------|
|     Sole proprietor      |SSN or EIN|   Schedule C (1040)    |  The default for a solo 1099 worker; no setup  |
|    Single-member LLC     |SSN or EIN|   Schedule C (1040)    | Same tax treatment; adds liability separation  |
|      S corporation       |   EIN    |Form 1120-S → K-1 → 1040|Can split salary vs. distribution to trim SE tax|
|      C corporation       |   EIN    |Form 1120 (entity pays) |   Double taxation; rare for solo contractors   |
|Partnership / multi-member|   EIN    | Form 1065 → K-1 → 1040 |             For two or more owners             |

If you'd rather not share your Social Security number with every client, grab a free [EIN from the IRS](https://www.irs.gov/businesses/small-businesses-self-employed/get-an-employer-identification-number).

Most 1099 contractors are not bookkeepers (and do not want to be). To avoid forensic accounting headaches, isolate your payment methods. For example, you can issue single-purpose debit cards via [Mercury](https://mercury.com).

![](https://taylor.town/expenses-000-002.png)

If your bank does not offer virtual debit card services, you can create isolated debit cards by opening new bank accounts. You can open a business checking account at many banks with just a personal SSN. If business accounts aren't available, personal checking accounts work perfectly fine.

Some people prefer the simplicity of having one true balance; others prefer budgeting against isolated balances. If using multiple accounts, direct business income to your business account and pay yourself regular wages.

Credit cards achieve the same end. If you charge business transactions to one dedicated credit card, your monthly statements will contain only business expenses. Consider enabling autopay to avoid unintended credit card debt.

![](https://taylor.town/expenses-000-004.png)

Remember that taxes are not automatically withheld from 1099 income. To avoid spending money owed to Uncle Sam, some contractors automatically redirect estimated taxes into an isolated high-yield savings account. Many clients are happy to send partial payments to two accounts, especially those who use direct deposit (ACH) services. If separate payments are not available, services like Mercury can be configured to automatically split income between accounts.

![](https://taylor.town/expenses-000-001.png)

If you're looking for something more tailored/integrated, consider one of the many banking platforms for small businesses: [Found](https://found.com), [Lili](https://lili.co), [Novo](https://www.novo.co), [Relay](https://relayfi.com), [Bluevine](https://www.bluevine.com), [NorthOne](https://www.northone.com), etc.

![](https://taylor.town/expenses-000-005.png)

If you want even more control, modern bookkeeping software also connects directly to bank accounts and automatically imports/sorts transactions. Popular picks: [QuickBooks Solopreneur](https://quickbooks.intuit.com/solopreneur/), [FreshBooks](https://www.freshbooks.com), [Wave](https://www.waveapps.com), [Keeper](https://www.keepertax.com), [Xero](https://www.xero.com/us/), [Expensify](https://www.expensify.com), etc.

![](https://taylor.town/expenses-000-006.png)

In rare cases, you may need to record physical receipts. Digitize them immediately and throw them away. If the receipt-scanners in QuickBooks/FreshBooks/Expensify/etc. are insufficient, try dedicated apps like [Dext](https://dext.com/us) and [Shoeboxed](https://www.shoeboxed.com).

Beware: thermal-paper receipts degrade over time. Never leave receipts in the sun.

![](https://taylor.town/expenses-000-003.png)

Mileage is its own beast. If you are willing to share your live GPS location with corporations, consider apps like [MileIQ](https://mileiq.com), [Stride](https://www.stridehealth.com/tax), and [Everlance](https://www.everlance.com).

![](https://taylor.town/expenses-000-007.png)

Taxes are easy if you maintain good financial hygiene.

Tax Savings
----------

When you make qualified investments into your business, the IRS will tax you as if you didn't earn that money.

Tax savings should be treated as a modest discount on business spending. Never excuse irresponsible spending because "it's a business expense".

Consider a single contractor with $100,000 of 1099 revenue and $15,000 of legitimate business expenses (tax year 2026, sole proprietor, no state income tax):

|                           |Report expenses|Ignore expenses|
|---------------------------|---------------|---------------|
|    Gross 1099 revenue     |  \+$100,000   |  \+$100,000   |
|Business expenses reported |   −$15,000    |      −$0      |
|**Net profit (Schedule C)**| **\=$85,000** |**\=$100,000** |
|    ½ SE-tax deduction     |    −$6,005    |    −$7,065    |
|   QBI deduction (§199A)   |   −$12,579    |   −$15,367    |
|    Standard deduction     |   −$16,100    |   −$16,100    |
|    **Taxable income**     | **\=$50,316** | **\=$61,468** |
|    Federal income tax     |   \+$5,790    |   \+$8,235    |
|    Self-employment tax    |   \+$12,010   |   \+$14,130   |
|   **Total federal tax**   | **\=$17,800** | **\=$22,365** |
|    Gross 1099 revenue     |  \+$100,000   |  \+$100,000   |
|     Total federal tax     |   −$17,800    |   −$22,365    |
|Cash spent on the business |   −$15,000    |   −$15,000    |
|       **Take-home**       | **\=$67,200** | **\=$62,635** |

In this example, the federal government awards 30 cents for every business dollar; those dollars dodge self-employment tax and income tax and shrink your QBI base. Bookkeeping preserves 7.3% ($4,565) of the contractor's total income.

Spending proportionally more on your business yields larger percentage gains:

|Expenses reported|as % of revenue|Tax saved|Take-home gain|
|-----------------|---------------|---------|--------------|
|     $10,000     |      10%      | $3,049  |    \+4.5%    |
|     $15,000     |      15%      | $4,565  |    \+7.3%    |
|     $20,000     |      20%      | $5,717  |    \+9.9%    |
|     $30,000     |      30%      | $8,022  |   \+16.8%    |

State taxes further increase these yields.

Income brackets (and spending habits) change these totals; the math is generally attractive to those who earn \~$60k+ per year. For those who earn (and spend) much more, a few hours of bookkeeping is the highest-paid work they'll do all year.