# AI Output Fact-Check Kit

From *Claude Code for Non-Programmers*, Chapter 21. Use this on anything AI-written before it goes public: a web page, a chapter, a sales sheet, a market report.

## 1. Standing rule for CLAUDE.md

Paste near the top of your project's `CLAUDE.md`.

```
## Facts rule
- Never write an ID, link, number, statistic, quote,
  price, date or person's name from memory.
- Every one of those must come from a file in this
  project, a lookup you ran in this session, or a
  source address you can show me.
- If you can't verify it, write [UNVERIFIED] next to it
  and tell me in your summary.
- When you say something is checked, show the raw
  result of the check, not your summary of it.
```

## 2. Sort-it prompt

```
Before I trust this, sort every factual claim in it
into four groups: machine-checkable, source-checkable,
live-checkable, judgment. For each claim, say where it
came from: a file, a lookup in this session, a source
address, or memory. Mark anything from memory
[UNVERIFIED].
```

## 3. ID check (Wikidata example)

```
Find every Wikidata ID (Q followed by digits) in this
project. For each one, look it up with Wikidata's
public API, using this address and replacing Q_NUMBER:

https://www.wikidata.org/w/api.php?action=wbgetentities&ids=Q_NUMBER&props=labels|descriptions&languages=en|mul&format=json

Make a table: ID | what my site says it is | the label
Wikidata returns | match yes/no | file and line.
Do not change anything. Report only.
```

For mismatches:

```
For each mismatch, search Wikidata with this address,
replacing NAME with the organization's name:

https://www.wikidata.org/w/api.php?action=wbsearchentities&search=NAME&language=en&format=json

Show me the top results with their descriptions.
I will choose the right one myself.
```

## 4. The checklist

```
AI OUTPUT FACT-CHECK LIST                 Date: __________

What is it? ______________________   Going where? __________

MACHINE-CHECKABLE (Claude runs the check, shows raw result)
[ ] Every ID looked up at its source
[ ] Every link opened; it says what we claim
[ ] Every total and price recalculated from my own files
[ ] Every date checked against the real record

SOURCE-CHECKABLE (address + exact sentence)
[ ] Every statistic has a source I can open
[ ] Every quote has a source, and the words match
[ ] Every rule or law cites the official page
[ ] I opened the 3 most important sources myself

LIVE-CHECKABLE (checked today, on the real site)
[ ] Market or niche claims checked on the live store
[ ] Competitor claims checked on the live store
[ ] Search claims checked on the live search page
    Date of live check: __________

PEOPLE AND QUOTES
[ ] Every named person and title checked at a source

TRADE WORDS
[ ] Words with a special meaning in my trade are
    spelled out, including what they are NOT

JUDGMENT
[ ] Opinions are written as opinions

Anything marked [UNVERIFIED] left?   Yes / No
If yes: it does not go public.
```

## 5. Live market check column

Add this to any idea or niche list a chatbot gave you.

```
| Idea | What the AI said | Live check (date) | Competitors found | Go / Kill |
|------|------------------|-------------------|-------------------|-----------|
|      |                  |                   |                   |           |
```

## 6. Trade-word phrase pattern

```
[WHAT I WANT], NOT [COMMON MIX-UP 1], NOT [COMMON MIX-UP 2]

Example: individual bulbs on white wire,
NOT rope light, NOT continuous tube
```
