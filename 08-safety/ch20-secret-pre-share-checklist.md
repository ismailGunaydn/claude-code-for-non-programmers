# Secret Pre-Share Checklist

From *Claude Code for Non-Programmers*, Chapter 20. Run this before you push a project to GitHub, send a folder to someone, share your screen or copy a file into a template.

```
SECRET PRE-SHARE CHECKLIST                Date: __________

What am I sharing? ________________________________
With whom?         ________________________________

BEFORE
[ ] Asked Claude to scan for secret-looking file names
    and lines, WITHOUT printing values (prompt below)
[ ] Checked editor and tool config files too, not just
    .env (connector configs, extension settings)
[ ] Checked the public / website folder for exports,
    CSV files, backups and test pages
[ ] Checked docs, notes and READMEs for pasted keys
[ ] .env.example has names only, no values
[ ] .gitignore covers .env, credentials, local settings
[ ] Screenshots: no keys, emails, account IDs or paths
[ ] Customer data replaced with sample data

IF A SECRET WAS ALREADY SHARED OR COMMITTED
[ ] 1. Remove it from the file
[ ] 2. Remove it from git history (ask Claude to explain
       the steps first; approve each one)
[ ] 3. REVOKE IT at the service and create a new one
[ ] 4. Put the new one in the right place (env var,
       git-ignored file, password manager)
[ ] 5. Confirm the old one no longer works
[ ] 6. Write down what happened, and the date

Step 3 is not optional. Removing a secret from a file
does not take it back from anyone who already saw it.
```

## The scan prompt (paste into Claude Code)

```
Search this folder for files that might hold secrets:
anything named .env, anything with "secret", "token",
"credential" or "key" in the file name, and any file
that contains the words password, api_key, apikey,
client_secret, token or Authorization.
Do NOT open or print any value. List only the file
name, the line number and the kind of thing you found.
```

## The "use it by name" prompt

```
The API key for [SERVICE] is in an environment
variable called YOUR_API_KEY. Write the script so it
reads the key from there. Never print the key, never
write it into a file, and never ask me to paste it.
```

## Where each secret goes

| Secret | Best home |
|---|---|
| Connector login, when sign-in is offered | Sign in through `/mcp`. No key to paste. |
| A key a script or connector needs | An environment variable, or a git-ignored `.env` file plus a deny rule |
| Your own copy to look up later | A password manager |
| Customer data Claude needs to work on | Sample or redacted data only |
