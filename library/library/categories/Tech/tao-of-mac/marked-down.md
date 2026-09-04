+++
title = "Marked Down"
description = "As a sort of prelude to the article below, I should point out that I do have an AI policy that boils down to “I use AI to revise, not to write”.But I do want to understand the limits and possibilities of what can be done and get a yardstick for both quali"
date = "2026-07-21T18:40:00Z"
url = "https://taoofmac.com/space/blog/2026/07/21/1840?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-07-22T09:22:44.966911037Z"
seen = false
+++

As a sort of prelude to the article below, I should point out that I do have [an AI policy](/space/site/ai_policy) that boils down to “I use AI to revise, not to write”.

But I do want to understand the limits and possibilities of what can be done and get a yardstick for both quality and reliability, so over the weekend, as the brand new Portuguese national exam system melted down, I gave [my usual agent](https://rcarmo.github.io/projects/piclaw/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) a set of conventional web search tools, a browser, and a clear set of directives:

* You are an investigative reporter.
* Research Portuguese news and government sites and prepare a dossier on the procurement, implementation and roll-out of the new national exam grading system.
* Gather interviews and press statements from government officials, teachers’ unions, schools, and political commentary.
* Verify those statements and gather substantive facts to build a comprehensive research dossier towards an Economist-style news article.
* Give me that article in Markdown and PDF format, written according to the Economist’s published writing and editorial style guide.

I also gave it an early version of [Memento](https://rcarmo.github.io/projects/memento/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), my new agentic memory system, but merely as a *record* of facts, and not really as a tool for it to reason about them (it’s not quite ready for that yet). But as you’d expect, the AI took to it swimmingly:

>
>
> Absolutely. I’ll apply the anti-trope and drafting-restraint rules as a hard line-edit layer—especially removing inflated stakes, empty pivots, canned contrasts, false certainty, needless jargon and cadence-by-repetition—without a specific personal style. The result will retain an Economist-like register: dry, compressed, analytical and occasionally wry, with conclusions proportionate to the evidence.
>
>

I ran this on Friday, over the weekend and, again, today (essentially asking it to update the dossier) using my Codex subscription and `gpt-5.6-sol`, and it was fascinating to see it double-checking and auditing its own research, even if its thinking still had the characteristic Californian enthusiasm that I find so grating:

>
>
> I realized that I made a mistake: it’s about exam copies, not grades. Now, I need to browse for relevant links related to this topic. My goal is to extract links that contain titles associated with exam copies. I want to make sure I’m focusing my search appropriately so I can gather the right information for what I need. Let’s get started on finding those links!
>
>

It was also very precise about the interpretation of facts, and attribution of statements:

>
>
> The reconciliation has already corrected the most consequential headline: **63,000 refers to digitised exam copies not yet distributed, not 60,000 pupils without grades**. The ministry says 227,000 of 290,000 scripts had reached more than 100,000 pupils. Some grades were still missing, but the public material I have found does not attach the 63,000 figure to them.
>
>

And it delegated to sub-agents with amazing prompts like:

>
>
> Act as a ruthless copy editor. Review the attached drafts for accuracy, contradictory references, manufactured contrast … against the dossier and transcripts in ....
>
>

All in all, it was a fascinating thing to do (and watch being done), and the results, I think, speak for themselves. And yes, it picked the title by itself…

---
[

Marked down
----------

](/space/blog/2026/07/21/1840#marked-down)[

Portugal’s digital exam-marking system has given the government some difficult answers
----------

](/space/blog/2026/07/21/1840#portugals-digital-exam-marking-system-has-given-the-government-some-difficult-answers)

*Late results, wrong grades and an emergency sitting have turned a technical reform into a test of administrative competence.*

**LISBON** – At 10.19am on July 17th Portugal’s education minister brought good news to parliament. Every national examination had been marked, he said, and the National Examinations Jury held all the grades. More than 166,000 secondary-school pupils had already waited three days beyond the original publication date. University applications opened the following Monday.

Teachers were reportedly marking papers that morning. Schools received result files at around 7.30pm, after their offices normally closed. Some kept staff late; others reopened over the weekend. EduQA, the public institute running the operation, later said that about 1,400 of 290,351 examinations were undergoing additional checks when it authorised release. Pupils awaiting grades found `-3` in the ENES admissions system. The code meant “suspended”; some school software displayed it without explanation.

On July 20th officials found that an automatic answer key for Physics and Chemistry A had been configured wrongly. Rerunning that question’s marking changed 12,613 grades: 11,496 rose and 1,117 fell. Later that day the jury reported faulty settings for two Geografia A questions. Schools received new lists and registration for that subject’s second phase was extended. A separate export error had already required another set of replacements.

By July 21st some pupils were sitting second-phase examinations while first-phase grades were being settled. Fernando Alexandre, the education minister, expected everyone to have a final grade by the end of the week. He conceded that pupils awaiting grades or corrections had already been disadvantaged. An extra sitting in September was announced for them; its rules and dates were being prepared.

The reform promised faster, auditable marking. A misconfigured answer key changed grades across the country.

[

Paper chase
----------

](/space/blog/2026/07/21/1840#paper-chase)

The examinations were taken on paper. The innovation began afterwards. Scripts were transported, scanned and divided into individual answers. Software distributed them to teachers, who marked through an online interface. Grades passed through quality checks, the examinations jury and school systems before reaching pupils.

Trouble began with the paper itself: staples hid QR codes, folded pages produced cropped images, continuation sheets disappeared and some scripts missed secure transport. Teachers waited for credentials, received incomplete answers and repeated work when corrected images arrived. On July 13th one mathematics teacher received 160 new items less than a day before the deadline. Further batches arrived after extensions had expired. Marking continued on results day.

The allocation of markers was equally muddled. On July 16th Mr Alexandre attributed the remaining work to a shortage of available teachers. The following evening he said willing teachers awaiting assignments had contacted him, even as the jury reported a shortage. More than 100 people registered for Portuguese had recorded zero scripts, he said. Their eligibility and assignment status remained unclear. On July 21st he described the organisation of 11,000 markers as deficient and proposed formal contracts. In five days the diagnosis had advanced from too few teachers to too little organisation.

The official timetable shifted too. On June 29th marking was on schedule and every pupil would be protected. Two days later Mr Alexandre dismissed most reports of failure as false. Publication then slipped from July 14th to the 17th, and the second examination period was postponed. By July 16th even the revised date was in doubt. The following evening he acknowledged that “the process did not go well”.

Schools inherited the final rush. Directors received incomplete files around closing time and were told to publish that day. Mr Alexandre threatened to seek explanations from directors who missed publication. Pupils could consult grades in “their applications”, he said, leaving each school to choose the application, login arrangements and publication time. Some pupils saw results that night; others waited through the weekend. Publication depended on each school’s staff and local software.

EduQA completed central validation on Saturday and made replacement files available from Sunday. The subject-level corrections and export repair followed. By Monday a grade could be present, corrected or suspended, depending on which file a school had received and when it had published it.

[

A system in pieces
----------

](/space/blog/2026/07/21/1840#a-system-in-pieces)

Early accounts referred to “the platform”. The name covered a chain of systems and operators.

One component prepared scanned files and distributed answers. Published accounts place it within EduQA’s operation. PCS/SCOI presented items to teachers for marking. Versions of that interface were developed by Blat, a small Portuguese design and software firm. Its remit covered the classification screen. Scanning, image quality, users, assignments and upstream processing were handled elsewhere.

Public contracts illuminate one corner of the operation. In 2017 IAVE, a predecessor of EduQA, paid Blatstudio-MAF-Serviços €30,375 plus tax for a practical-test module and SCOI upgrades. In 2023 a legally distinct company, Blat-Creative Powerhouse, received €19,080 plus tax for another update. The published total is €49,455 before tax, with long gaps in the record. The scanning, allocation and export faults arose beyond the work described in those agreements.

Blat’s ownership opened a political subplot. One shareholder, with a 5% stake, had worked on campaigns for the centre-right Social Democrats and advised Carlos Moedas, Lisbon’s mayor. The records describe two small software contracts, awarded six years apart, and contain no sign that politics influenced either award. Many operational failures arose outside Blat’s remit.

A much dearer replacement is under construction. In July 2025 IAVE signed a €1.5m contract with Axianseu II Digital Consulting for GAEBS, a future examination-management system. Delivery is expected later. Deloitte reportedly provided emergency technical help after a security weakness caused an outage. A search of the contract register by July 21st yielded no entry setting out its fee or remit. Mr Alexandre also authorised EduQA to buy up to €500,000 of emergency support; expenditure under that authority awaited publication.

“The platform” was a useful singular noun while digitisation was a reform to defend. During parliamentary scrutiny it separated into preparation, classification, export, the jury and school systems. The machinery divided the work and, conveniently, the blame.

[

Wrong by design
----------

](/space/blog/2026/07/21/1840#wrong-by-design)

Luís Pereira dos Santos, EduQA’s president, told parliament on July 21st that the technology had been tested several times and introduced gradually. He cited ninth-year mathematics, which uses a similar paper-and-scan process. In the same hearing he acknowledged unexpected computer faults and problems moving information between the preparation and classification systems.

EduQA has yet to publish the scope and results of testing for the full secondary-school operation. That operation turned 290,351 scripts into more than 2m items, handled by thousands of teachers and several databases against a fixed admissions calendar. Many failures occurred as work moved between organisations or systems.

A 2025 pilot with the Philosophy examination added a dispute over institutional memory. Luís Duque de Almeida, then president of the examinations jury, says it exposed serious problems. Mr Alexandre told parliament that his predecessor had left office without a report. Mr Duque de Almeida replied that the ministry had requested none. Later in the hearing a secretary of state said officials had received information about the pilot in another form.

Parliament debated whether the missing document qualified as a report. Officials have yet to publish the faults recorded, who received the findings and what changed before national adoption. The hearing established that information existed in some form, without establishing what officials did with it.

Quality control fared worst on the answer keys. The Physics and Chemistry item was worth ten points out of 200. Its key awarded incorrect marks across the country until complaints prompted another run. Geografia followed. Reprocessing took minutes. Both settings had passed the checks before publication.

[

The price of doubt
----------

](/space/blog/2026/07/21/1840#the-price-of-doubt)

A formal reappraisal usually requires a €25 deposit for each examination, refundable when the grade improves. Directors, opposition parties and pupil representatives asked for the charge to be suspended after the failures. Mr Alexandre kept it. Central digitisation faults would be corrected free of charge; ordinary disputes over marking would follow the usual procedure.

This is tidy from the ministry’s side of the counter. A pupil staring at an implausible grade has little means of choosing among a cropped scan, a wrong answer key, an export fault, a manual entry or an examiner’s judgment. A family challenging several papers must pay before learning which part of the state needs correcting.

The first university-application period runs from July 20th to August 6th. Reappraisal results are scheduled for August 7th, although regulations provide a short later window for updated grades and choices. Pupils must meanwhile seek advice, consider appeals and decide whether to sit another examination.

The September sitting is intended for pupils who lacked enough information for the ordinary second phase. It will count as that phase, and Mr Alexandre said the September 14th admissions deadline would move. At 5.50pm on July 21st the eligibility rules, registration dates and examination timetable awaited publication.

A government notice issued that afternoon repeated the pledge that every pupil would be protected. Hours earlier the minister had described some as already disadvantaged. The notice praised the rapid correction of 11,496 Physics and Chemistry grades that rose, omitting the 1,117 decreases and the Geografia error.

Mr Alexandre has promised an external audit covering ownership of each step, checks on automatic keys, the Philosophy pilot, marker allocation, emergency contracts and the shifting totals for examinations, pupils and schools. Portugal preserved the original scripts throughout. Paper, having survived its digital upgrade, may now be the most reliable witness.

---

*Information checked through 5.50pm WEST on July 21st 2026. Subtracting the rounded ministry figure of 227,000 distributed copies from roughly 290,000 scripts gives an estimated 63,000 awaiting distribution. Reports counted copies and left the corresponding number of pupils unspecified. Figures for Physics and Chemistry A use the internally consistent JNE/ministry totals reported by TEK: 12,613 changed grades, comprising 11,496 increases and 1,117 decreases. A late RTP report carried variants that do not add up. The number affected by the Geografia A error awaited publication.*

[

Sources
----------

](/space/blog/2026/07/21/1840#sources)

* [EduQA’s account of release and additional validation](https://eduqa.pt/informacao-sobre-a-afixacao-das-pautas-comos-resultados-dos-exames-nacionais/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [Official higher-education admissions calendar](https://www.dges.gov.pt/pt/pagina/calendario-concurso-nacional-de-acesso-0?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [Emergency procurement authority, Despacho 8649-A/2026](https://diariodarepublica.pt/dr/detalhe/despacho/8649-a-2026-1145102263?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [Physics and Chemistry A error and export fault](https://tek.sapo.pt/noticias/ciencia/artigos/exames-nacionais-ministro-confirma-erro-tecnico-em-fisica-e-quimica-a-mas-nega-falha-em-matematica-b/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [Geografia A parametrisation error](https://www.rtp.pt/noticias/pais/erro-de-avaliacao-em-exames-de-geografia-a-obriga-a-publicacao-de-novas-pautas_n1754670?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [Minister’s July 17th SIC interview](https://sicnoticias.pt/pais/educacao/2026-07-17-video-ministro-da-educacao-da-todas-as-explicacoes-sobre-caos-nos-exames-nacionais-em-entrevista-a-sic-a81ccfc6?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [July 17th parliamentary chronology](https://www.rtp.pt/noticias/pais/exames-nacionais-em-debate-de-urgencia-no-parlamento_e1753993?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [July 21st parliamentary hearing and live record](https://www.rtp.pt/noticias/pais/ministro-da-educacao-promete-que-todos-os-alunos-terao-notas-ate-ao-final-da-semana_e1754812?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [Official July 21st Government notice](https://portugal.gov.pt/pt/gc25/comunicacao/noticias/ministro-da-educacao-garante-que-nenhum-aluno-sera-prejudicado-?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [Minister’s admission that some pupils were already disadvantaged](https://eco.sapo.pt/2026/07/21/ministro-da-educacao-reconhece-que-alguns-alunos-ja-estao-prejudicados-mas-nega-experimentalismo/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [EduQA’s testing claim](https://cnnportugal.iol.pt/eduqa/exames-nacionais/presidente-do-eduqa-garante-que-sistema-de-digitalizacao-dos-exames-nacionais-foi-testado-varias-vezes/20260721/6a5f4354d34e511da0b2eb96?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [EduQA’s account of unexpected IT and information-flow problems](https://expresso.pt/educacao/ensino-secundario/2026-07-21-presidente-do-eduqa-foram-detetados-problemas-informaticos-inesperados-7c58f858?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [The 2025 pilot dispute](https://expresso.pt/educacao/ensino-secundario/2026-07-21-ex-presidente-do-juri-de-exames-confirma-que-nao-deixou-relatorio-porque-nao-lhe-foi-pedido-como-e-que-decide-sem-informacoes-do-jne--5669e0bd?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [Digital-copy distribution figures](https://expresso.pt/educacao/2026-07-21-mais-de-60-mil-alunos-nao-receberam-ainda-a-prova-ministro-confia-que-ate-ao-final-da-semana-todos-vao-saber-a-sua-nota-d7c59585?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [September rules absent as phase two began](https://expresso.pt/educacao/ensino-secundario/2026-07-21-2-fase-dos-exames-arrancou-sem-que-os-alunos-conhecam-as-regras-para-poder-ir-a-epoca-especial-21992e2d?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [ECO investigation of suppliers and contracts](https://eco.sapo.pt/especiais/a-microempresa-por-tras-do-caos-nos-exames-nacionais-que-abriu-uma-crise-de-confianca-no-sistema/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [2017 Blatstudio contract](https://www.base.gov.pt/Base4/pt/detalhe/?type=contratos&id=10623588&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [2023 Blat contract](https://www.base.gov.pt/Base4/pt/detalhe/?type=contratos&id=11602654&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* [TSF on the digital-copy platform](https://www.tsf.pt/sociedade/artigo/plataforma-de-envio-de-exames-pode-existir-mas-nao-esta-carregada-e-como-se-nao-existisse/18107034?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)

---

Although there are still some stilted, noticeably AI twists in the prose and the “facts” it investigated were already tinged by some journalistic interpretations (except for interview transcripts–I gave it access to Whisper APIs, so it just went and downloaded videos to transcribe and translate), this is pretty amazing, and whatever people think, I rate it as another milestone in real LLM usage.

If I can do it on a lark, imagine what news corporations will be able to do in the future–for fact checking, hopefully, at the very least.

I’m linking [the PDF version](/media/blog/2026/07/21/1840/8cgjzKNLryVa6gYsu_cwNcgTLjc=/marked-down.pdf), which is just lovely, and [the research brief](/media/blog/2026/07/21/1840/3i_03TzcfRh07fKzEjv6w07IHzA=/research-brief.pdf), because, well, reporting has to be transparent, right?