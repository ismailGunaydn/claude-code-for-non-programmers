# Client-Data Checklist

From *Claude Code for Non-Programmers*, Chapter 20. Fill this in once before the first session that could touch client records (ID and tax numbers, tax or financial records, bank details, payroll, health information). Fill it in again when your plan, your tools or your professional duties change.

This checklist is not legal advice. Your professional and legal duties come first.

```
CLIENT-DATA CHECKLIST                     Date: __________

MY DUTIES
[ ] I know my legal / professional duties for client data
    Where I checked: ________________________________
[ ] My client agreements allow (or forbid) outside services?
    ________________________________________________

WHERE CLIENT FILES LIVE
[ ] Client files live OUTSIDE every folder Claude works in
    Client folder: ___________________________________
[ ] Deny rules for that folder in ~/.claude/settings.json:
      "Read(//**/[CLIENT FOLDER]/**)"
      "Edit(//**/[CLIENT FOLDER]/**)"
[ ] Tested in a fresh session:
    "Read a file in my client folder"  -> refused? Y / N

GIT AND BACKUPS
[ ] Client folder name is in .gitignore
[ ] Client files are NEVER on GitHub or any public or
    private code repository
[ ] Client backups are encrypted and meet my duties
    Backup method: ___________________________________

MY PLAN'S DATA TERMS (re-check: terms change)
[ ] Opened claude.ai/settings/data-privacy-controls
    Model-improvement setting is: ON / OFF   Date: ______
[ ] Read the current data-usage page for my plan
    (Free / Pro / Max = consumer; Team / Enterprise / API
    = commercial terms)
[ ] Local transcripts: kept ___ days (cleanupPeriodDays)
[ ] Laptop disk encryption is on

HOW I PROMPT
[ ] Placeholders and client codes: [CLIENT], [AMOUNT]
    Never names, ID numbers, account numbers
[ ] When a job needs details: the least I can send,
    identifying details stripped first
[ ] No /feedback and no "Yes" to transcript sharing from
    a session that touched client data

WHERE I DO NOT USE AI AT ALL
[ ] Written down:
    _________________________________________________
    _________________________________________________
    (for example: anything my rules forbid sharing,
    anything I can't de-identify, anything that files,
    signs or sends on a client's behalf)

IF CLIENT DATA WAS SHARED BY MISTAKE
[ ] 1. Stop. Don't repeat it in the next prompt
[ ] 2. Write down what, when and in which session
[ ] 3. Check the training setting for my plan
[ ] 4. Check whether my rules require me to report it
[ ] 5. Fix the cause (folder, deny rule, prompt habit)
```

Source for the plan terms: Anthropic's Claude Code data-usage page (code.claude.com/docs/en/data-usage), read 2026-10-17. Check it again before you rely on it.
