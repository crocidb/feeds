+++
title = "Life GPA"
description = "They taught you to make number go up."
date = "2025-01-28T00:00:00Z"
url = "https://taylor.town/lgpa"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.207351592Z"
seen = true
+++

.input-group { margin-top: 4rem; margin-bottom: 1rem; display: grid; grid-template-columns: auto 1fr 8rem; align-items: center; gap: 1rem 2rem; width: 100%; max-width: 100%; margin-left: 0; padding: 0 2rem; } .input { display: inline-flex; align-items: center; gap: 1rem; } .input-group \> label { text-align: right; } input[type="number"] { padding: 0.25rem; text-align: right; min-width: 6rem; width: 100%; } input[type="range"] { min-width: 6rem; width: 100%; } .result { margin-top: 2rem; padding: 0 1rem; text-align: right; font-size: 1.25rem; margin-left: 0; width: 100%; max-width: 100%; } .result \> span { font-weight: 700; font-size: 1.5rem; } table { border-collapse: collapse; margin-top: 2rem; margin-left: 0; padding: 0 2rem; width: 100%; } table input { min-width: 4rem; width: 100%; } th, td { padding: 0.5rem; text-align: right; font-weight: 300; white-space: nowrap; font-size: 1rem; } .lgpa-row { font-weight: bold; } .slider-container { position: relative; padding: 0.5rem; } .slider-ticks { display: flex; justify-content: space-between; padding: 0 10px; font-size: 0.75rem; } input[type="number"], .slider-container { background-color: white; border: 1px solid #ccc; border-radius: 4px; } @media (prefers-color-scheme: dark) { input[type="number"], .slider-container { background-color: rgba(0,0,0,0.7); border: 1px solid #ccc; } input[type="range"]::-webkit-slider-runnable-track { background: #222; } input[type="range"]::-webkit-slider-thumb { background: #222; } input[type="range"]::-moz-range-track { background: #222; } input[type="range"]::-moz-range-thumb { background: #222; } input[type="range"]::-ms-track { background: #222; } input[type="range"]::-ms-thumb { background: #222; } } @media (max-width: 550px) { .input-group { grid-template-columns: auto 1fr; } .slider-container { display: none; } } pre { font-size: 1.5rem; } @media (max-width: 550px) { pre { font-size: 1.15rem; } }

Volunteering

0 100 1k 10k 100k

 hours

Net worth

0 100k 1M 100M 1B

 dollars

Fitness

0 25 50 75 100

 %ile

 Personal LGPA: 0

|            |Child 1|Child 2|Child 3|Child 4|Child 5|
|------------|-------|-------|-------|-------|-------|
|Volunteering|       |       |       |       |       |
| Net worth  |       |       |       |       |       |
|  Fitness   |       |       |       |       |       |
|            |   0   |   0   |   0   |   0   |   0   |

 Total LGPA: 0

 function mapVolunteering(sliderValue) { // Map 0-100 to 0-100000 exponentially return Math.round(Math.pow(10, sliderValue / 20) - 1); } function mapNetworth(sliderValue) { // Map 0-100 to 0-1B exponentially return Math.round(Math.pow(10, sliderValue / 20 + 2) - 100); } function inverseMapVolunteering(value) { // Inverse of mapVolunteering return value \<= 0 ? 0 : Math.round(20 \* Math.log10(value + 1)); } function inverseMapNetworth(value) { // Inverse of mapNetworth return value \<= 0 ? 0 : Math.round(20 \* (Math.log10(value + 100) - 2)); } function calculateComponentLGPA(volunteering, networth, fitness) { // Validate inputs if (volunteering \< 0 || networth \< 0 || fitness \< 0 || fitness \> 100) { return 0; } // Calculate individual components const volComponent = volunteering \> 0 ? Math.log(volunteering) : 0; const netComponent = networth \> 0 ? Math.log10(Math.max(1, networth)) : 0; const fitComponent = fitness \> 0 ? Math.log(fitness) / Math.log(1.5) : 0; // Calculate LGPA return volComponent \* netComponent \* fitComponent; } function getChildValues(childNum) { return { volunteering: parseFloat(document.querySelector(`tr.vol [data-child="${childNum}"]`).value) || 0, networth: parseFloat(document.querySelector(`tr.net [data-child="${childNum}"]`).value) || 0, fitness: parseFloat(document.querySelector(`tr.fit [data-child="${childNum}"]`).value) || 0 }; } function calculateLGPA() { const volunteering = parseFloat(document.getElementById('volunteering').value) || 0; const networth = parseFloat(document.getElementById('networth').value) || 0; const fitness = parseFloat(document.getElementById('fitness').value) || 0; const personalLGPA = calculateComponentLGPA(volunteering, networth, fitness); document.getElementById('lgpa-result').textContent = personalLGPA.toFixed(2); // Calculate children's LGPAs let childrenLGPA = 0; for (let i = 1; i \<= 5; i++) { const child = getChildValues(i); const childLGPA = calculateComponentLGPA(child.volunteering, child.networth, child.fitness); document.getElementById(`child-lgpa-${i}`).textContent = childLGPA.toFixed(2); childrenLGPA += childLGPA / 4; } // Update total LGPA const totalLGPA = personalLGPA + childrenLGPA; document.getElementById('total-lgpa').textContent = totalLGPA.toFixed(2); } // Slider change handlers document.getElementById('volunteering-slider').addEventListener('input', (e) =\> { const value = mapVolunteering(parseFloat(e.target.value)); document.getElementById('volunteering').value = value; calculateLGPA(); }); document.getElementById('networth-slider').addEventListener('input', (e) =\> { const value = mapNetworth(parseFloat(e.target.value)); document.getElementById('networth').value = value; calculateLGPA(); }); document.getElementById('fitness-slider').addEventListener('input', (e) =\> { document.getElementById('fitness').value = e.target.value; calculateLGPA(); }); // Number input change handlers document.getElementById('volunteering').addEventListener('input', (e) =\> { const value = parseFloat(e.target.value) || 0; document.getElementById('volunteering-slider').value = inverseMapVolunteering(value); calculateLGPA(); }); document.getElementById('networth').addEventListener('input', (e) =\> { const value = parseFloat(e.target.value) || 0; document.getElementById('networth-slider').value = inverseMapNetworth(value); calculateLGPA(); }); document.getElementById('fitness').addEventListener('input', (e) =\> { document.getElementById('fitness-slider').value = e.target.value; calculateLGPA(); }); // Add event listeners to children inputs document.querySelectorAll('tr input').forEach(input =\> { input.addEventListener('input', calculateLGPA); }); // Initial calculation calculateLGPA();

They taught you to make number go up. They said that obedient kids get good grades, that productive people get paid, that the wealthy are powerful and free and attractive and happy.

But life doesn't always provide obvious numbers. You had GPA but graduated. You had ELO but got a job. You had KPIs but took vacation. You had matches but got married. You had salary but got laid off. You had citations but created a human. You had BMI but got diagnosed. You had numbers but you changed.

They baked "number go up" into your traditions, beliefs, cultural norms, media, milieu, etc. They programmed you to make number go up, and it's difficult/dangerous to edit that stubborn firmware. People who venture beyond their prescribed structures (e.g. school, work) often feel anxious and worthless.

So maybe you need a number to strive, to thrive, to win. That's okay. You may need that number to synthesize structure for what to do, how to live, who to become.

LGPA is a number. When you are aimless and/or despondent, you can make this number go up. It won't guarantee happiness, but it can incentivize some of its correlates:

```
LGPA =
  ln(♡) * log10($) * log[3/2](☺)
    + sum(lgpa(child[i]) / 4)

♡ = volunteer hours
$ = net worth
☺ = fitness percentile
```

Some non-obvious beliefs are encoded into LGPA:

* **Balanced:** The LGPA formula punishes [min-maxing](https://en.wikipedia.org/wiki/Powergaming), i.e. LGPA is zero if fitness or wealth or volunteering are zero.
* **Curved:** In this formula, each variable adds diminishing returns, e.g. growing $10K into $100K is as valuable as $10M into $100M.
* **Sharable:** Couples/families can use shared LGPA to strategize specialized roles, e.g. LGPA(Alice+Bob) ≥ LGPA(Alice)+LGPA(Bob).
* **Domestic:** Many definitions of "success" are blind to domestic labor. Good parents should feel like valuable contributors to society.
* **Independent:** Parents shouldn't fulfill dreams/goals through children. In this formula, parents are incentivized to pursue personal growth.
* **Responsible:** Your life is not fungible. Spending money on charity cannot be exchanged for spending time on charity.
* **Accomodating:** The definitions of "fitness" and "volunteering" are purposefully vague enough to accomodate many worldviews/beliefs. Two reasonable respective starting-points: *age-adjusted VO2-Max percentile* and *unprofitable hours spent on strangers*.
* **Economic:** This formula assumes that most dollars are earned via positive-sum interactions. If true, net worth is a crude measure for the amount of value one has created for other people. "Cumulative non-inherited net worth" might be a more appropriate variable for LGPA.

They taught you to make number go up -- don't play by their rules. You needn't feed your organs into a vending machine. You can pursue your own number; you can use that number to synthesize structure.

One day, you might build your stable structure far from those institutions. Revel in your success -- your health, your abundance, your compassion. With enough distance, you'll forget you ever wanted to be a number.