#!/bin/sh
# block-dangerous-commands.sh  (Mac and Linux)
# Chapter 12, "Hooks: Rules That Run Themselves"
#
# A PreToolUse hook. Same logic as the Windows version:
# if the command text contains a listed word, refuse with exit code 2
# and tell Claude why. Otherwise allow with exit code 0.
#
# Save as:  .claude/hooks/block-dangerous-commands.sh  in your project.

input=$(cat)

for word in "git stash" "git reset" "git clean" "git checkout" \
            "git restore" "git push --force" "git push -f" \
            "rm -rf" "rm -fr" "rm -r "; do
  if printf '%s' "$input" | grep -qiF -- "$word"; then
    echo "Blocked by the owner's safety hook: the command contains '$word'. Do not try another way to do the same thing. Stop, explain why you need it, and ask the owner." >&2
    exit 2
  fi
done

exit 0
