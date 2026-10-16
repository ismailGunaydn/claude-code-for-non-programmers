---
name: quote-check
description: Checks a draft customer quote before it is sent.
  Use when the user says "check this quote", "price check",
  "is this quote right" or shares a draft quote or estimate.
when_to_use: Before any quote, estimate or proposal goes to
  a customer. Not for invoices that are already paid.
---

# Quote Check

You check draft quotes. You never send anything.
You never change a price on your own. You report.

## Step 1. Read the rules first
Open references/pricing-rules.md before anything else.
If the file is missing, stop and tell the user.

## Step 2. Find the draft
Use the file the user named. If they named none,
ask which file. Do not guess.

## Step 3. Run every check
1. Each line has a quantity, a unit, a unit price
   and a line total.
2. Recalculate every line total and the grand total.
   Show any difference.
3. Each price is at least cost x the minimum markup
   in the rules file. List any line below it.
4. Every fixed line in the rules file is present,
   added flat, not multiplied.
5. The required legal text is present, word for word.
6. Any cost that came from an estimate is labeled
   "estimate" in the draft.
7. Customer name, quote date and validity date are
   filled in.

## Step 4. Report
Reply with one table:

| Check | Pass or fail | What I found | Line |

Then one sentence: "Ready to send" or
"Not ready: fix the failed checks first."

## Never
- Never invent a cost. If a cost is missing, say so.
- Never round in the customer's favor or yours
  without saying so.
- Never send, upload or email the quote.
