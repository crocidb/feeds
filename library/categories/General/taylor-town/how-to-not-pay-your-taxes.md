+++
title = "How To Not Pay Your Taxes"
description = "Your government wants you to create taxable wealth."
date = "2026-03-19T00:00:00Z"
url = "https://taylor.town/succession-000"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.119603474Z"
seen = true
+++

\#tax-sim .controls { display: grid; grid-template-columns: 1fr 1fr; gap: 0.5rem 1.5rem; margin-bottom: 1.5rem; } @media (max-width: 550px) { #tax-sim .controls { grid-template-columns: 1fr; } } #tax-sim .controls label { display: block; font-size: 0.9em; line-height: 1.4; } #tax-sim .controls input[type=range] { width: 100%; margin: 0.2rem 0 0.4rem; } #tax-sim .controls .val { font-weight: bold; float: right; } #tax-sim .controls .period-group { font-size: 0.9em; line-height: 1.4; display: flex; align-items: center; gap: 0.75rem; padding-top: 0.4rem; } #tax-sim .controls .period-group label { display: inline; font-size: inherit; } #tax-sim table { width: 100%; font-size: 0.85em; font-variant-numeric: tabular-nums; } #tax-sim th, #tax-sim td { text-align: right; white-space: nowrap; } #tax-sim th:first-child, #tax-sim td:first-child { text-align: left; } #tax-sim tfoot td { font-weight: bold; border-top: 2px solid currentColor; } #tax-sim .neg { opacity: 0.6; } #tax-sim #sim-compare { font-size: 0.9em; opacity: 0.7; margin-top: 0.75rem; }

Starting Cash Annual Return Volatility Loan Rate Leverage Depreciation Front-Load Tax Rate

 Period:  Years  Decades

|Period|Invested|Asset Value|Debt|Depreciation|Taxes|Cash Out|Equity|
|------|--------|-----------|----|------------|-----|--------|------|

 (function () { var $ = function (id) { return document.getElementById(id); }; var fmt = new Intl.NumberFormat("en-US", { style: "currency", currency: "USD", maximumFractionDigits: 0, notation: "compact" }); var f = function (n) { return fmt.format(n); }; function mulberry32(a) { return function () { a |= 0; a = a + 0x6D2B79F5 | 0; var t = Math.imul(a ^ a \>\>\> 15, 1 | a); t = t + Math.imul(t ^ t \>\>\> 7, 61 | t) ^ t; return ((t ^ t \>\>\> 14) \>\>\> 0) / 4294967296; }; } function gaussian(rng) { var u = rng(), v = rng(); return Math.sqrt(-2 \* Math.log(u)) \* Math.cos(2 \* Math.PI \* v); } function simulate() { var startCash = +$("k-start").value; var annualReturn = +$("k-return").value / 100; var vol = +$("k-vol").value / 100; var loanRate = +$("k-loan").value / 100; var leverage = +$("k-lev").value; var frontLoad = +$("k-dep").value / 100; var taxRate = +$("k-tax").value / 100; var periodLen = +document.querySelector('input[name="k-period"]:checked').value; var periods = 10; $("v-start").textContent = f(startCash); $("v-return").textContent = $("k-return").value + "%"; $("v-vol").textContent = $("k-vol").value + "%"; $("v-loan").textContent = $("k-loan").value + "%"; $("v-lev").textContent = leverage + "x"; $("v-dep").textContent = $("k-dep").value + "%"; $("v-tax").textContent = $("k-tax").value + "%"; var seed = Math.round(vol \* 1000) + 1; var rng = mulberry32(seed); var cash = startCash; var rows = []; var totalTaxes = 0; var naiveCash = startCash; for (var i = 0; i \< periods; i++) { var periodReturn; if (vol === 0) { periodReturn = Math.pow(1 + annualReturn, periodLen); } else { periodReturn = 1; for (var y = 0; y \< periodLen; y++) { periodReturn \*= (1 + annualReturn + gaussian(rng) \* vol); } } var equity = Math.max(0, cash); var borrowed = equity \* leverage; var invested = equity + borrowed; var assetValue = invested \* periodReturn; var loanBalance = borrowed \* Math.pow(1 + loanRate, periodLen); // depreciation + interest shelter the gain var depreciation = invested \* frontLoad; var interest = loanBalance - borrowed; var revenue = assetValue - invested; var taxableIncome = Math.max(0, revenue - depreciation - interest); var taxes = taxableIncome \* taxRate; // refi: new loan at same LTV on appreciated asset, pay off old loan var refiLTV = leverage / (1 + leverage); var newLoan = assetValue \* refiLTV; var cashOut = Math.max(0, newLoan - loanBalance); // equity = what you walk away with after paying off debt and taxes var endEquity = assetValue - loanBalance - taxes; // naive: same equity, no leverage, no depreciation, pay full taxes on gains var naiveValue = naiveCash \* periodReturn; var naiveGain = Math.max(0, naiveValue - naiveCash); var naiveTax = naiveGain \* taxRate; naiveCash = naiveValue - naiveTax; totalTaxes += taxes; cash = endEquity; rows.push({ label: (periodLen === 10 ? "Decade " : "Year ") + (i + 1), invested: invested, assetValue: assetValue, debt: loanBalance, depreciation: depreciation, taxes: taxes, cashOut: cashOut, equity: endEquity }); } var html = ""; for (var j = 0; j \< rows.length; j++) { var r = rows[j]; html += "\<tr\>\<td\>" + r.label + "\</td\>" + td(r.invested) + td(r.assetValue) + td(r.debt) + td(r.depreciation) + td(r.taxes) + td(r.cashOut) + td(r.equity) + "\</tr\>"; } $("sim-body").innerHTML = html; var last = rows[rows.length - 1]; var totalCashOut = 0; for (var j = 0; j \< rows.length; j++) totalCashOut += rows[j].cashOut; $("sim-foot").innerHTML = "\<tr\>\<td\>Total\</td\>" + "\<td\>\</td\>\<td\>\</td\>\<td\>\</td\>\<td\>\</td\>" + td(totalTaxes) + td(totalCashOut) + td(last.equity) + "\</tr\>"; var naiveTotalTax = startCash \* (last.equity / startCash - 1) \* taxRate; $("sim-compare").textContent = "Without deferral, your " + f(startCash) + " would be " + f(naiveCash) + " instead of " + f(last.equity) + "."; } function td(n) { return "\<td" + (n \< 0 ? ' class="neg"' : "") + "\>" + f(n) + "\</td\>"; } var inputs = document.querySelectorAll("#tax-sim input[type=range], #tax-sim input[type=radio]"); for (var i = 0; i \< inputs.length; i++) { inputs[i].addEventListener("input", simulate); } simulate(); })();
>
>
> **tl;dr:**
>
>
>
> 1. Defer US taxes by reinvesting your taxable income into the economy as business expenses, depreciating assets, etc.
> 2. For your leveraged investments, pay yourself in refinanced cash when your investments appreciate and/or credit rates drop.
>
>

You can ~~dodge~~ defer US taxes if you reinvest your dollars into the economy. This is no loophole; the system is working as intended. Your government wants you to create taxable wealth.

Equity is taxable wealth that already exists. You cannot create wealth by purchasing $10k of AAPL equity. You can create wealth by investing $10k in an apple orchard.

But you must reinvest your dollars in a particular way that Uncle Sam understands. When you report business expenses on your tax return, you inform the IRS what you spent on enterprise. The US tax code rewards entrepreneurial pursuits which grow the economy. Uncle Sam happily forgoes $1 now for $11 next decade -- it's the same slice from a larger pie.

To perpetually defer taxes on your taxable wealth, keep reinvesting your surplus. The IRS forgoes $10 now for $110 next decade, $100 for $1,100, and so on.

If you aren't actually reinvesting capital, pay your damn taxes. Don't be an asshole.

Depreciation spreads business expenses over time. If you invest $100 in a lawnmower that earns $11 per year, this depreciation schedule will minimize your total taxable income each year:

|  Year   |Revenue |Depreciation|Taxable Income|
|---------|--------|------------|--------------|
|    1    |  $11   |    $10     |      $1      |
|    2    |  $11   |    $10     |      $1      |
|    …    |   …    |     …      |      …       |
|   10    |  $11   |    $10     |      $1      |
|**Total**|**$110**|  **$100**  |   **$10**    |

But you can also ask the IRS to treat it as $10/year for 10 years rather than $11/year for 9 years. You might consider this schedule if your other investments lost $11 this year:

|  Year   |Revenue |Depreciation|Taxable Income|
|---------|--------|------------|--------------|
|    1    |  $11   |     $0     |     $11      |
|    2    |  $11   |    $11     |      $0      |
|    …    |   …    |     …      |      …       |
|   10    |  $11   |    $11     |      $0      |
|**Total**|**$110**|  **$100**  |   **$11**    |

Let's say your other investments gain $89 this year, so you front-load the lawnmower depreciation schedule. You pay zero taxes this year, but you've increased your tax obligations in future years:

|  Year   |Revenue |Depreciation|Taxable Income|
|---------|--------|------------|--------------|
|    1    |  $11   |    $100    |    \-$89     |
|    2    |  $11   |     $0     |     $11      |
|    …    |   …    |     …      |      …       |
|   10    |  $11   |     $0     |     $11      |
|**Total**|**$110**|  **$100**  |   **$99**    |

To defer taxes, deduct yesterday's expenses from today's revenue. Good accountants will massage depreciation schedules to match unexpected profits/losses.

Example: Instead of depreciating a building over 27.5 or 39 years, a cost segregation study could reclassify components (carpeting, fixtures, landscaping, certain electrical) into 5, 7, or 15-year assets. In this way, a $2M property could accrue $200K–$300K in depreciation deductions its first year.

Again, this is intentional. If you contribute more to the US economy than you siphon out, your government will happily pretend you're penniless.

A politician attracts investments into their constituency via tax incentives. Unfortunately, some tax incentives are loopholes which invite crooks to claim exemptions without truly contributing. It is difficult to distinguish whether a loophole is corrupt or negligent, and impossible to prosecute politicians either way.

Most investment money is borrowed (e.g. SBA loans, commercial real estate loans). Your government wants you to create wealth, so it loans money to banks at a magic interest rate. Banks may lend that money to you at a higher rate.

If you contribute loaned wealth to the US economy, you must siphon your dollars out in a way that Uncle Sam understands. One popular method is refinancing, i.e. paying off your old loan with a new loan and pocketing the cash difference. Loaned money isn't taxable income, so you can save/spend it without affecting your tax rate.

*Disclaimer:* Loans ain't free. Refinancing ain't easy.

Death is a popular escape from deferred taxes. When you die, your obligations to the government vanish. Your heirs inherit assets/property at market value. Their assets depreciate from new cost bases.

According to [Modern Monetary Theory](https://en.wikipedia.org/wiki/Modern_Monetary_Theory), taxes are a method of pulling dollars out of circulation. The government never actually needed your money anyway.

Your life on Earth continues long after you die. Every dollar you've spent, saved, borrowed, lent, donated, willed -- it all mattered. People will commute on the roads you paid for, or taste apples from your trees, or pollute the Pacific Ocean, or survive tuberculosis, or eat pasta, or overdose on fentanyl, or play chess, or gossip, or whatever people do.