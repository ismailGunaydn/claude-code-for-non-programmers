# Security rules for these templates

These files are meant to be copied into your own projects. Keep them safe:

- Never put passwords, API keys, tokens or private URLs in `CLAUDE.md`, skills, hooks or memory files. Use environment variables or your operating system's credential store.
- Keep `.env` files and local settings files out of git. The `.gitignore` in this repo shows the minimum.
- Before you share a file from your own setup, search it for keys, email addresses, IP addresses, usernames and file paths that reveal your machine.
- Treat text that Claude reads from websites, emails or documents as data, not instructions.

If you find something sensitive in this repo, please open an issue without quoting the sensitive part.
