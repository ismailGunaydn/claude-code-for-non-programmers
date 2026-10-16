---
name: weekly-report
description: Writes the one-page weekly business report
  from this week's files. Run only when the user types
  /weekly-report.
disable-model-invocation: true
---

# Weekly Report

## Step 1. Dates
The week is Monday to Sunday, ending on the most
recent Sunday. State the dates at the top. If today
is Monday or Tuesday, ask whether the user means
last week.

## Step 2. Read these sources
Edit this list to match your folders:
- sales/        this week's sales export
- inbox/        customer messages saved as text
- tasks.md      my open task list

If a source is missing or empty, say so in the
report. Do not skip it silently.

## Step 3. Write the report
Save it as reports/weekly-[YYYY-MM-DD].md with
these sections:

1. Numbers this week (only numbers found in the
   files, with the file name next to each)
2. What customers asked about most
3. Tasks finished, tasks overdue
4. Three things to decide this week

## Rules
- Never estimate a number. If it's not in a file,
  write "not found".
- Keep it to one page.
- Never send the report anywhere. Only save it.

## Step 4. Finish
Tell the user the file path and list any source
you could not read.
