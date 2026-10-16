# Parallel Audit Kit

## First: should this be a subagent?

```
SHOULD THIS BE A SUBAGENT?

[ ] The job means reading a lot: many files, many pages
[ ] I only need the result, not every step
[ ] The job can be described in a few sentences
[ ] It can be split into parts that don't depend on
    each other (then: several helpers in parallel)
[ ] A fresh pair of eyes helps (a reviewer who didn't
    write the thing)

Two or more ticks: use a helper.
None: just ask in the main session.
```

## Prompt

```
Run 5 read-only subagents in parallel on [WHAT].
Each one looks only through its own lens:

1. Accuracy: numbers, dates, prices, claims
2. Broken things: links, missing pages, missing images
3. Trust: credentials, author details, claims that need a source
4. Consistency: same product, same price everywhere
5. Customer view: what's confusing or missing

Rules for every subagent:
- Read-only. No edits, no moves, no deletes.
- Every finding needs file (or page) + location
  + a short quote.
- Report counts you actually measured, and say how
  you counted.

When they report back, do NOT fix anything yet.
Fill in the verification table and show it to me.
```

## Verification table

```
VERIFICATION TABLE                        Date: __________

#  Finding (agent's words)  File:line  Confirmed?  Real count
-- ------------------------ ---------- ----------- ----------
1  ______________________   ________   Y / N       ________
2  ______________________   ________   Y / N       ________
3  ______________________   ________   Y / N       ________
4  ______________________   ________   Y / N       ________

WHEN TWO AGENTS DISAGREE
Claim A: _______________________  (agent ____)
Claim B: _______________________  (agent ____)
Primary source checked: _______________________
Which one was right: A / B / neither

Approved to fix (by me): # ____ # ____ # ____
Final check runs over: [ ] everything  [ ] a sample (why?)
```
