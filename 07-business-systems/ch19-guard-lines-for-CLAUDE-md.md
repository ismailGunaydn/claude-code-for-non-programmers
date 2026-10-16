## Guard lines
- Deleting: approval covers only the files I named.
  If the list grows, stop and ask again.
- After any bulk find-and-replace: run the checks
  (type check, build or test) before saying "done".
- Money fields (payment links, affiliate links, prices):
  read the field back from the page before publishing.
  If it doesn't contain [MY LINK OR VALUE], don't publish.
- Big changes: build them behind one switch, so one
  change turns them off again.

## Scoped rule example (save in .claude/rules/)

```
---
paths:
  - "drafts/**"
---

# Rules for drafts
- [YOUR RULES FOR THIS KIND OF FILE]
```
