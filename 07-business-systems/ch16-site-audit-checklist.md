# Site Audit Checklist (Chapter 16)

Print it, or keep a copy next to each site's files. Fill in real counts only.

```
SITE AUDIT CHECKLIST           Site: ____________  Date: ______

RULE 1: Count in the built pages, never in the source files.
RULE 2: Every finding gets a real count, a page or file,
        and "confirmed by me: Y/N".

A. WHAT GOOGLE SEES
[ ] Live-test screenshot, home + 2 key pages: full page?
[ ] Raw HTML: sections that start hidden: ____
[ ] Any section stretched by a "full screen height" setting?
[ ] Menu links present in raw HTML, not only after a click?
[ ] Pages you want indexed are allowed (no stray noindex)?

B. LINKS
[ ] Broken internal links in built pages: ____
[ ] INCOMING internal links to each money page: ____
[ ] Example links inside code blocks turned into real links?
[ ] Pages nothing links to: ____

C. TAGS
[ ] Canonical tags pointing to a page that errors: ____
[ ] Language tags present? (search ignoring upper/lower case)
[ ] Missing titles or descriptions (recount yourself): ____

D. MEASUREMENT
[ ] Analytics: outgoing data requests counted, not script tag
[ ] Zero data requests before cookie consent?

E. MONEY
[ ] Share of impressions from queries that never convert: __%
[ ] Section that converts best: ______________

F. THE TOOLS THEMSELVES
[ ] Fix doesn't show? Compare output file time vs source time
[ ] Green audit script? Write down what it actually counts

FINDINGS
| # | Finding | Page/file | Real count | Confirmed | Approved |
|---|---------|-----------|------------|-----------|----------|
|   |         |           |            |           |          |
```

## The audit prompt

Open Claude Code in the site's folder. Change the parts in square brackets.

```
Load the seo-lessons skill first.

Audit [SITE] with the checklist in
templates/ch16-site-audit-checklist.md.

Use up to 4 read-only helpers in parallel, one per
section group: A+B, C, D+E, F. Helpers may read and
search only. No edits, no git commands, no deploys.

Count in the built pages in [BUILD FOLDER], or in raw
HTML you save from the live site. Not in source files.

Then check every helper finding yourself: open the page,
recount with your own search, look at 3 examples by hand.
Fill in the findings table with real counts only.
Change nothing. I'll approve fixes one by one.
```
