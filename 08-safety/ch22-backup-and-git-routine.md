# Backup and Git Routine Sheet

From *Claude Code for Non-Programmers*, Chapter 22. Tape it next to your screen. Every line is something you type into Claude Code in plain words.

## One-time setup (per project)

```
FIRST: copy the .gitignore starter (ch20-gitignore-starter.txt)
       into the project folder as .gitignore.

THEN paste this into Claude Code:

I want this folder saved with git, with a private copy
on GitHub. Go one step at a time and wait for my OK
after each step.
1. Check whether git is installed. If not, tell me how
   to install it and stop.
2. Check that a .gitignore file is in this folder. If
   not, stop and tell me.
3. Show me the list of files that WOULD be committed.
   Point out anything that looks private or secret.
4. After my OK, make the first commit with the note
   "Start".
5. Explain in plain words how to connect this to a
   PRIVATE GitHub repository. Never make it public.
```

## Daily routine

```
WHEN I SIT DOWN (either computer)
  "Pull the latest version of this project and tell me
   what changed since I was last here."

WHEN I FINISH A PIECE OF WORK
  "Commit everything I changed for this phase. Write a
   note that says what changed, in one line. Show me
   the file list before you commit."

BEFORE I LEAVE
  "Is there anything uncommitted or not pushed? List it.
   Then push."

RULES
  - One line, no branches.
  - One commit per finished phase.
  - Never "commit everything" without seeing the list.
```

## Weekly check

```
WEEKLY CHECK                          Date: __________

Paste into Claude Code:

Check this project's health. Do not change or delete
anything. Report only.
1. Compare every committed file on disk with the
   fingerprint git recorded. List any that don't match.
2. List files that are untracked (not in git and not
   ignored). For each one, ask whether it matters.
3. Check that image files and PDFs open correctly:
   images end properly, PDFs start with a PDF header.
4. Ask git to check its own records for damage.
5. Tell me the date of the last push to GitHub.

[ ] Files that don't match: ______  (restore from GitHub)
[ ] Untracked files that matter: ______  (commit or back up)
[ ] Last push date: __________
```

## Monthly backup check

```
MONTHLY BACKUP CHECK                  Date: __________

[ ] Backup drive copy ran this month
[ ] Copy only adds and updates, never deletes
[ ] Ran the weekly check prompt on the backup copy too
[ ] Opened 3 random files from the backup by hand
[ ] Memory / instruction folder is in its own private
    repository and was pushed this week
```

## Which undo do I need?

```
Claude just made an edit I don't like (this session)
  -> Esc Esc, or /rewind                 (checkpoint)

I want the project as it was last Tuesday
  -> "Show me the commits since last Monday.
      Restore the project to the one I choose."  (git)

My computer died, was stolen or the disk failed
  -> Clone the private GitHub copy onto a new
     computer. Restore big files from the backup
     drive.                                   (backup)

Claude sent, published or changed something online
  -> No undo button covers this. Fix it at the
     service itself. Next time, put that action on
     your ask list (Chapter 20).
```
