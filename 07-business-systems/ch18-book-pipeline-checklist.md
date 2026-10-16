# Long-Document Pipeline (Chapter 18)

```
LONG-DOCUMENT PIPELINE            Project: __________

STAGE       OUTPUT FILE       CHECK               GATE
1 Shelf     shelf-check.md    Live store, top 8   Real demand? Y/N
                              results, dates,
                              sales rank
2 Score     market-score.md   Weighted score      Go / Kill
3 Spec      spec.md           Promise, format,    I signed it? Y/N
                              privacy rules
4 Research  features.md       Source link per     Every line
                              line                sourced? Y/N
            case-cards.md     Source per card
                              (never printed)
5 Voice     ch01.md           Read aloud by me    Sounds like me?
6 Writers   chNN.md           Only from research  OPEN CHECKs
                              files and cards     listed? Y/N
7 Scan      scan-report.txt   Secrets, names,     Zero hits? Y/N
                              money, banned
                              words
8 Review    review-notes.md   Facts / privacy /   All fixed? Y/N
                              reader / style
9 Build     print.pdf, ebook  Page numbers,       Proof OK? Y/N
                              fonts, code blocks
                              readable
10 Cover    cover.pdf         Margins MEASURED    In the safe
                              in pixels           zone? Y/N
11 Listing  listing.md        Claims match book   Y/N
12 Upload   calendar.txt      Slots left this     Slot free? Y/N
                              week

Rule: no stage starts until the gate before it says yes.
```

## The scan prompt

```
Write a small script that scans the files I name and
reports, per file, with line numbers:
- email addresses, phone numbers, web addresses
- file paths and anything that looks like a key or token
- this list of private names: [CLIENTS, PROJECTS]
- money amounts (currency signs, "USD", "TL" and so on)
- these banned words: [YOUR LIST]
Report only. Never change a file.
Then run it on [DRAFTS FOLDER] and show me the result.
```
